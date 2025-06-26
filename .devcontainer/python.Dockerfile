# Install uv
FROM python:3.13-alpine3.22 AS builder
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Change the working directory to the `app` directory
WORKDIR /app

# Copy the project into the intermediate image
COPY uv.lock pyproject.toml /app/

# Install dependencies
RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync --locked --no-install-project --no-editable

# Sync the project
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --locked --no-editable

FROM python:3.13-alpine3.22

# Cria usuário não-root
RUN addgroup -S dev && adduser -S devuser -G dev

# Copy the environment, but not the source code
COPY --from=builder --chown=devuser:dev /app/.venv /app/.venv

ENV PATH="/app/.venv/bin:$PATH" \
    VIRTUAL_ENV="/app/.venv" \
    PYTHONPATH="/app"

WORKDIR /app

COPY --chown=devuser:dev . /app

EXPOSE 8000

USER devuser

# Run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

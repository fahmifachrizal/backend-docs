# Environment Variables

## Overview

The application follows the **12-Factor App** methodology and stores configuration in the environment. This ensures that the code remains the same across deployments while configuration varies.

## Required Variables

These variables represent system-wide contracts and must be supported by **all** framework implementations.

| Variable | Description | Default / Example |
|----------|-------------|-------------------|
| `DATABASE_URL` | Full connection string for PostgreSQL | `postgresql://user:pass@localhost:5432/inventory` |
| `SECRET_KEY` | Cryptographic key for signing tokens | `random-secure-string` |
| `PORT` | HTTP port to listen on | `8000` |

## Optional / Framework-Specific Variables

Different frameworks may support additional variables for tuning. Common examples include:

| Variable | Description |
|----------|-------------|
| `DEBUG` | Toggle verbose logging or debug mode |
| `LOG_LEVEL` | Minimum log severity (INFO, DEBUG, ERROR) |
| `ENVIRONMENT` | Deployment stage (development, production) |

## Example `.env` File

Create a file named `.env` in the project root. This file is excluded from version control.

```ini
# System Contracts
DATABASE_URL=postgresql://postgres:postgres@localhost:5432/inventory
SECRET_KEY=change-me-to-something-secure
PORT=8000

# Common Options
DEBUG=true
ENVIRONMENT=development
```

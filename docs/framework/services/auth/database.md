# Auth Database Relationships

This service manages security credentials.

## Core Tables

- **[auth_credentials](../../tables/auth_credentials.md)**: Stores password hashes.
    - Linked to **[users](../../tables/users.md)** (1:1 relationship).

## Usage Guidelines
- Never modify the `users` table directly from this service; only read `user_id` to link credentials.

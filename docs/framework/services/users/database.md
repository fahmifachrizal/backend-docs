# Users Database Relationships

This service owns the core identity tables.

## Core Tables

- **[users](../../tables/users.md)**: The central identity record.
    - Has a Foreign Key to **[roles](../../tables/roles.md)** to define permissions.
- **[roles](../../tables/roles.md)**: Definitions of roles (Admin, User, etc.).

## Usage Guidelines
- The `users.id` is the global key used by all other services (Orders, Auth, etc.) to reference a user.

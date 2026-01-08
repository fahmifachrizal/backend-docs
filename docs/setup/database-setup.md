# Database Setup

## Requirements

The core system architecture relies on **PostgreSQL**. The schema design is normalized and assumes relational integrity constraints.

## Schema Initialization

### 1. Create the Database

Create a standard PostgreSQL database named `inventory` (or as specified in your `DATABASE_URL`).

```bash
createdb inventory
```

### 2. Run Migrations

The system uses specific schema definitions (Users, Products, Inventory, etc.). You must run the migration tool specific to your backend framework to apply these schemas.

Examples of migration commands:
- **Node.js (TypeORM/Prisma)**: `npm run migration:run` or `npx prisma migrate dev`
- **Python (Alembic)**: `alembic upgrade head`
- **Go (Migrate)**: `migrate -path ./migrations -database ... up`

## Seeding Data

Most implementations provide a seed script to populate the database with initial test data (admin users, sample products).

Check the project `README` or `Makefile` for a `seed` command.

## Health Check

To verify the database configuration:
1. Ensure the application starts without connection errors.
2. Check that the core tables (`users`, `products`, `transactions`) exist in the database using a SQL client.

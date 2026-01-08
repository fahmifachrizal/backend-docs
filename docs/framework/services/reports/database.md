# Reports Database Relationships

This service strictly reads from other domains or maintains its own materialized views.

## Related Tables (Read-Only)
- **[orders](../../tables/orders.md)**
- **[inventory_transactions](../../tables/inventory_transactions.md)**

## Usage Guidelines
- NEVER write to operational tables. Use read-replicas or specific analytic events.

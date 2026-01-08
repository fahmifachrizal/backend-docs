# Inventory Database Relationships

This service manages the stock ledger.

## Core Tables

- **[inventory_items](../../tables/inventory_items.md)**: Current stock snapshot (read-optimized).
    - Links to **[products](../../tables/products.md)**.
- **[inventory_transactions](../../tables/inventory_transactions.md)**: Immutable history of movements (write-master).

## Usage Guidelines
- Do not update `inventory_items` directly without a corresponding `inventory_transaction`.

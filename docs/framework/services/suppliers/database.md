# Suppliers Database Relationships

This service owns vendor data.

## Core Tables

- **[suppliers](../../tables/suppliers.md)**: Vendor profiles.
- **[supplier_products](../../tables/supplier_products.md)**: Catalog links.
    - Links **[suppliers](../../tables/suppliers.md)** to **[products](../../tables/products.md)**.

## Usage Guidelines
- Tracks cost prices specific to each supplier.

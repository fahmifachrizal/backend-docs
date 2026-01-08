# Orders Database Relationships

This service owns transaction records.

## Core Tables

- **[orders](../../tables/orders.md)**: Order headers.
    - Links to **[users](../../tables/users.md)** (customer).
- **[order_items](../../tables/order_items.md)**: Order details.
    - Links to **[products](../../tables/products.md)** (item).

## Usage Guidelines
- `order_items` must snapshot the price at the time of purchase.

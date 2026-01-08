# Products Database Relationships

This service owns the product catalog.

## Core Tables

- **[products](../../tables/products.md)**: Item definitions.
- **[categories](../../tables/categories.md)**: Taxonomy hierarchy.
- **[product_categories](../../tables/product_categories.md)**: Many-to-Many link between products and categories.

## Usage Guidelines
- `products.sku` is the immutable business identifier used for external communication.

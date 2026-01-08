# Table: suppliers

## Entity Definition

```mermaid
erDiagram
    suppliers {
        uuid id PK
        varchar name
        varchar contact_email
        varchar phone
        text address
        boolean is_active
    }
```

## Columns

- **name**: Vendor name.

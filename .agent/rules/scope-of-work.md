---
trigger: always_on
---

The project implements a complete backend system for an Inventory
Management application as a modular monolith. The system is designed to
model real-world inventory operations while remaining structurally
simple enough to be reproducible and well-documented.

The backend exposes a REST-based API and includes authentication,
authorization, data persistence, business logic enforcement, and
operational concerns such as caching, validation, and error handling.

The system is not a mock or toy example; all core workflows are fully
implemented and documented.

The inventory domain is selected because it naturally exercises a wide
range of backend concerns:

- Strong data relationships (users, products, inventory, orders)
- Transactional integrity (stock in/out, order fulfillment)
- Authorization boundaries (roles and permissions)
- Read-heavy and write-heavy access patterns
- Aggregation and reporting requirements

These characteristics make the domain ideal for evaluating architectural
decisions, layering discipline, and backend system behavior.

The system defines a normalized relational schema with clear ownership:

- Users
  - Identity, credentials, roles
- Products
  - SKU, name, metadata
- Inventory
  - Current stock levels per product
- Inventory Transactions
  - Immutable stock movement records (in/out)
- Orders
  - Order headers and line items
- Suppliers
  - Source entities for stock intake
- Reports (derived)
  - Aggregated, read-only views

Tables are designed to:
- Preserve historical data
- Avoid destructive updates for critical events
- Support efficient querying and aggregation

Authentication is token-based and stateless.

Design decisions:
- Credentials are never stored in plaintext
- Tokens carry minimal identity and role information
- Authorization is enforced at the API boundary
- Services assume authenticated context

Authorization follows a role-based access model:
- Roles define coarse-grained access
- Permissions are enforced per endpoint
- Business rules are validated in services

Each request follows a strict flow:

1. Request validation
2. Authentication and authorization
3. Service-level business logic
4. Data persistence or retrieval
5. Response mapping
6. Error handling (if applicable)

Business rules are centralized in services and never duplicated across
endpoints. Controllers remain thin and orchestration-focused.

Inventory changes are modeled as immutable transactions.

Key design decisions:
- Stock levels are derived from transaction history
- Stock-in and stock-out operations are explicit
- Negative stock is prevented by service-level rules
- Inventory history is auditable

This approach prioritizes correctness and traceability over simplicity.

Caching is applied selectively to read-heavy operations:

- Product listings
- Inventory summaries
- Report endpoints

Cache design considerations:
- Cache keys include filters and pagination
- Write operations trigger invalidation
- Cached data is treated as disposable
- Cache consistency favors correctness over freshness

Errors are classified and handled consistently:

- Validation errors (client input)
- Authentication/authorization errors
- Business rule violations
- System and infrastructure errors

Design rules:
- Services throw domain-specific errors
- API layer translates errors into responses
- Error formats are consistent across endpoints
- Internal errors do not leak implementation details

Testing is layered to reflect system structure:

- Unit tests for business logic
- Integration tests for API + database behavior
- Controlled test data and migrations
- Repeatable test execution

Testing decisions prioritize:
- Determinism over coverage metrics
- Business rule validation over framework behavior
- Confidence in refactoring and change

OUT OF SCOPE
------------
- UI or frontend development
- Event-driven or asynchronous processing
- Distributed systems concerns
- Production scaling and deployment automation

This scope defines a backend system that is technically complete,
architecturally disciplined, and suitable for deep analysis and
documentation.
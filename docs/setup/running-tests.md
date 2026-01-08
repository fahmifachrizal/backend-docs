# Running Tests

## Test Strategy

The architecture defines two standard testing layers that should be implemented regardless of the language:

### 1. Unit Tests

- **Scope**: Individual functions, services, and business rules.
- **Dependencies**: Moked or stubbed (no real database access).
- **Speed**: Fast execution.

### 2. Integration Tests

- **Scope**: API endpoints and full request flows.
- **Dependencies**: Real database (often a separate test instance).
- **Speed**: Slower, covers end-to-end correctness.

## Running Tests

Execute the test suite using the standard test runner for your framework.

Examples:
- **Node.js**: `npm test` or `jest`
- **Python**: `pytest`
- **Go**: `go test ./...`

## Test Environment

Integration tests typically require a clean database state.
- Ensure your test configuration points to a separate database (e.g., `inventory_test`) to avoid deleting development data.
- The test runner usually handles schema creation and teardown automatically.

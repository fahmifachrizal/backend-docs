# Authentication Flow

## Overview

This document describes the **end-to-end authentication and authorization flow** used across the system. Authentication is implemented centrally and enforced consistently across all services, ensuring that identity, access control, and security rules are applied uniformly.

The system uses **token-based authentication** to maintain a stateless API while still allowing secure access to protected resources.

---

## Registration Flow

Registration is the process of creating a new authenticated identity in the system.

Conceptually, registration follows these steps:

1. A client submits a registration request containing identity credentials (e.g., name, email, password).
2. The API layer validates the request format and required fields.
3. The Auth service:
   - Normalizes identity fields (e.g., email lowercasing)
   - Hashes the password using a secure hashing algorithm
   - Verifies that the identity does not already exist
4. A new user record is created and persisted.
5. A successful response is returned to the client.

Important characteristics:

- Passwords are never stored in plain text.
- Registration does NOT automatically grant elevated permissions.
- Role assignment follows predefined defaults.

---

## Login Flow

Login establishes an authenticated session by verifying user credentials and issuing an access token.

Conceptual steps:

1. The client submits login credentials.
2. The API forwards the request to the Auth service.
3. The Auth service:
   - Locates the user by identity (e.g., email or username)
   - Compares the provided password with the stored hash
4. If verification succeeds:
   - A new access token is generated
   - Token metadata (issuer, expiration) is embedded
5. The token is returned to the client.

Key points:

- Failed login attempts do not reveal whether the identity exists.
- Token issuance is stateless.
- No server-side session storage is required.

---

## Token Strategy

### Token Type

The system uses **JSON Web Tokens (JWT)** as the primary authentication token.

JWTs are:

- Self-contained
- Signed (not encrypted)
- Verifiable without database access

### Token Creation

A token is created during successful login and includes:

- User identifier
- Role or permission claims
- Issued-at timestamp
- Expiration timestamp

### Token Validation

For every protected request:

1. The token is extracted from the request (e.g., Authorization header).
2. The signature is verified.
3. Expiration time is checked.
4. Claims are parsed into a user context.

If any step fails, the request is rejected.

### Expiration Strategy

- Tokens have a fixed lifetime.
- Expired tokens are rejected without exception.
- Clients must re-authenticate after expiration.

Refresh tokens may be introduced in the future but are not part of the current design.

---

## Authorization Check Flow

Authorization ensures that an authenticated user is allowed to perform a specific action.

Flow:

1. Request enters the API layer.
2. Authentication middleware:
   - Validates the token
   - Attaches user context to the request
3. Authorization rules are evaluated:
   - Role-based checks
   - Permission-based checks
4. If authorization succeeds:
   - Request proceeds to the service layer
5. If authorization fails:
   - Request is rejected with an appropriate error

Authorization logic is enforced **before** business logic execution.

---

## Authentication Enforcement Across Services

Authentication is enforced consistently using middleware:

- All protected routes require authentication
- Middleware executes before controllers
- Services assume a validated user context

Rules:

- Controllers do not manually validate tokens
- Services do not parse tokens directly
- User identity is always derived from request context

This ensures:

- Single source of truth for authentication
- No duplicated security logic
- Predictable access control behavior

---

## Failure Scenarios

The system explicitly handles the following failure cases:

- Invalid credentials
- Expired token
- Malformed token
- Missing authentication token
- Insufficient permissions

Behavior:

- Failures return standardized error responses
- No sensitive information is leaked
- All failures are logged for audit and monitoring

---

## Summary

The authentication flow is designed to be:

- Stateless
- Secure by default
- Consistent across all services
- Easy to reason about and extend

By centralizing authentication and enforcing strict boundaries, the system maintains strong security guarantees while remaining scalable and maintainable.

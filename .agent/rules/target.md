---
trigger: always_on
---

This documentation exists to explain a backend system in a way that is
clear, traceable, and reproducible, regardless of the underlying
technology used to implement it. The goal is not to document a specific
framework, but to document the *system itself* — its structure, behavior,
and decisions — so that the same documentation model can be applied
consistently across different implementations

Documentation must prioritize understanding over completeness. Every
page should help the reader answer at least one of the following:
- What does this part of the system do?
- Why was it designed this way?
- How does it interact with other parts?
- What assumptions does it make?

The documentation is intentionally structured top-down. Readers should
be able to start at the architectural level, understand the overall
shape of the system, and progressively move toward more concrete
details such as services, endpoints, and operational behavior. This
approach avoids overwhelming readers with implementation details before
they understand context.

Each documentation layer has a distinct responsibility:
- Architecture explains *system-level decisions*
- Setup explains *how to run and configure the system*
- Services explain *business responsibilities*
- Endpoints explain *external contracts*
- Security, performance, and testing explain *cross-cutting behavior*

No document should try to cover more than its assigned responsibility.

Service documentation must describe *capabilities*, not just endpoints.
Each service overview should explain:
- What business problem the service owns
- What data it is responsible for
- What operations it exposes
- What it explicitly does not handle

Endpoints are documented separately to avoid mixing business intent with
transport-level details. This separation ensures that API contracts
remain clear even if internal implementation changes.

Endpoint documentation must be explicit, predictable, and uniform.
Every endpoint page should be readable in isolation and must clearly
state:
- What the endpoint does
- What it requires
- What it returns
- How failures are communicated

Endpoints should be described as contracts, not code walkthroughs.
Internal implementation details are only included when they clarify
behavior or constraints

Documentation should be written as if the reader has not seen the code.
It must never rely on “obvious from the implementation” reasoning.
If something matters for correctness, performance, or security, it must
be documented explicitly

Conversely, documentation should avoid unnecessary repetition or
framework-specific terminology. When a concept is common across backend
systems, it should be described in general terms rather than tied to a
specific tool or library

All documentation must be consistent in tone, structure, and depth.
Differences between sections should reflect differences in purpose, not
author preference. Consistency enables comparison, reduces cognitive
load, and increases trust in the material

Documentation is considered complete not when it describes everything,
but when a knowledgeable reader can understand the system, reason about
its behavior, and reproduce its structure with confidence

This documentation is a design artifact, not an afterthought.
It is treated with the same rigor as code, and changes to the system
must be reflected in the documentation as part of the same process.
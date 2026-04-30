# Architecture Decision Records (ADRs)

This directory contains records of significant architectural decisions made during the development of this platform. Each ADR documents the context, decision, and consequences of a particular technical choice.

We follow the [Michael Nygard format](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions).

## Index

| # | Title | Status | Date |
|---|---|---|---|
| [0001](./0001-use-apache-iceberg-as-table-format.md) | Use Apache Iceberg as the table format | Accepted | 2026-04-29 |

## Creating a new ADR

1. Copy `template.md` to `NNNN-short-title.md` (use the next sequential number)
2. Fill in the sections
3. Update this index
4. Commit with message: `docs(adr): add ADR-NNNN <title>`

## When to write an ADR

Write an ADR when you make a decision that:

- Has long-lasting consequences (database choice, framework, language)
- Was hard to make (genuine trade-offs were considered)
- Future you (or someone else) will wonder "why did we do this?"
- Establishes a precedent or pattern for the codebase

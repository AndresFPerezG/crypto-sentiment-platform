# ADR 0001: Use Apache Iceberg as the table format

**Status**: Accepted
**Date**: 2026-04-29
**Deciders**: Andres

## Context

This project requires a modern table format for the lakehouse layer (bronze, silver, gold tiers stored on object storage). The format must support:

- ACID transactions on data lake files
- Schema evolution (add/drop/rename columns without rewriting)
- Time travel for reproducible queries and rollback
- Partition evolution without rewriting historical data
- Engine-agnostic access (Spark, Trino, DuckDB, Snowflake, BigQuery)
- Active open-source community and clear governance

The candidates are Apache Iceberg, Delta Lake, and Apache Hudi.

## Decision

Use **Apache Iceberg** as the table format for all layers (bronze, silver, gold).

## Consequences

### Positive
- True engine-agnosticism: Iceberg tables can be read by Spark, Trino, DuckDB, Snowflake (Polaris), BigQuery, and Athena natively in 2026.
- Hidden partitioning: queries don't need to know partition columns.
- Partition evolution: change partitioning strategy without rewriting old data.
- REST catalog standard (Polaris, Lakekeeper, Glue) provides a clear migration path to managed services.
- Apache Software Foundation governance — vendor-neutral.
- Demonstrates familiarity with the format that won the lakehouse war in 2025-2026.

### Negative
- Smaller Python ecosystem than Delta — `pyiceberg` library has fewer downloads than `deltalake`.
- More complex initial setup vs Delta's simpler defaults inside Databricks.
- Catalog choice (Hive, REST, Glue, Nessie, Polaris) adds a decision point.

### Neutral
- Performance is roughly comparable to Delta for most workloads at the scale of this portfolio project (<100GB).

## Alternatives Considered

### Alternative 1: Delta Lake
- Pros: Mature Python library, deep Databricks integration, simple defaults, large community.
- Cons: Historically tied to Spark/Databricks runtime; engine support outside Databricks improved via UniForm but Iceberg compatibility is one-way.
- Why rejected: Engine-agnosticism is more valuable for a portfolio project that needs to demonstrate flexibility across the modern data stack.

### Alternative 2: Apache Hudi
- Pros: Strong CDC and upsert capabilities, mature streaming support.
- Cons: Lost mindshare significantly in 2024-2025; smaller community; fewer engines support it natively.
- Why rejected: Industry momentum has moved decisively to Iceberg.

## References

- [Apache Iceberg documentation](https://iceberg.apache.org/)
- [Confluent Developer: Apache Iceberg course](https://developer.confluent.io/courses/apache-iceberg/)
- [Snowflake Polaris Catalog](https://www.snowflake.com/en/data-cloud/polaris/)
- [Onehouse: Iceberg vs Delta vs Hudi comparison](https://www.onehouse.ai/blog/apache-hudi-vs-delta-lake-vs-apache-iceberg-lakehouse-feature-comparison)

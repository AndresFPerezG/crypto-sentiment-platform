# 🪙 Crypto Sentiment Platform

-> Real-time data engineering pipeline that ingests crypto market data and news sentiment, correlating them to detect signal divergences in <1s.

[![CI](https://github.com/AndresFPerezG/crypto-sentiment-platform/actions/workflows/ci.yml/badge.svg)](https://github.com/AndresFPerezG/crypto-sentiment-platform/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.12](https://img.shields.io/badge/python-3.12-blue.svg)](https://www.python.org/downloads/)

## 🎯 Problem

Crypto traders and analysts need to react instantly when news sentiment diverges from market behavior. This platform ingests trades from Binance WebSocket and news events from GDELT, correlates them in tumbling time windows, and triggers alerts when significant divergences appear.

## 🏗️ Architecture

-> **Status**: 🚧 Under construction — Week 1 of 8.

## 🛠️ Tech Stack

| Layer | Tool | Why |
|---|---|---|
| Language | Python 3.12 | LTS, modern async support |
| Package mgmt | uv | 10-100x faster than pip |
| Streaming ingestion | WebSockets + Redpanda | Native exchange streams |
| Lakehouse | Apache Iceberg + MinIO | Engine-agnostic open standard |
| Transformation | dbt-core 1.9 | Industry standard for SQL transforms |
| Orchestration | Apache Airflow 3.0 | Most demanded in DE job market |
| Stream processing | Spark Structured Streaming | Same skills as batch Spark |
| Observability | OpenLineage + Marquez + Elementary | Open standards |
| IaC | Terraform | Reproducible cloud infra |
| CI/CD | GitHub Actions + OIDC | No static secrets |

## 🚀 Quickstart

-> **Status**: 🚧 Coming end of Week 1.

```bash
git clone git@github.com:REPLACE_USER/crypto-sentiment-platform.git
cd crypto-sentiment-platform
make up           # Start local stack
make demo         # Run demo ingestion
```

## 📂 Project Structure
.
├── ingestion/         # dlt pipelines + custom Python ingestors
├── transformations/   # dbt project (staging → intermediate → marts)
├── orchestration/     # Airflow DAGs and plugins
├── streaming/         # Kafka producers/consumers + Spark jobs
├── data_quality/      # Soda + Elementary checks
├── infrastructure/    # Terraform modules
├── dashboard/         # Streamlit + Evidence.dev dashboards
├── docs/              # Architecture, ADRs, runbooks
└── tests/             # Unit, integration, e2e tests

## 📖 Documentation

- [Architecture Decision Records](./docs/adr/)
- [Runbooks](./docs/runbooks/)
- [Data Dictionary](./docs/data_dictionary.md)

## 🏃 Roadmap

- [x] Week 1 — Foundations: setup, repo structure, first WebSocket ingestor
- [ ] Week 2 — Bronze layer: MinIO + Iceberg + batch ingestion (dlt)
- [ ] Week 3 — Orchestration: Airflow 3.0 DAGs
- [ ] Week 4 — Transformations: dbt + Kimball star schema
- [ ] Week 5 — Streaming: Kafka + Spark Structured Streaming
- [ ] Week 6 — Data Quality + Observability
- [ ] Week 7 — IaC: Terraform + GCP + CI/CD
- [ ] Week 8 — Documentation, blog post, video demo

## 📝 License

MIT — see [LICENSE](./LICENSE).

## 👤 Author

**Andres Felipe Pérez Guizaho** — Data Analyst transitioning to Data Engineering
- LinkedIn: www.linkedin.com/in/andresperez-data-analyst
- Github: https://github.com/AndresFPerezG

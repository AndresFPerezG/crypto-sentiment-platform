# Contributing

Thanks for your interest! This is a personal portfolio project but feedback and PRs are welcome.

## Development setup

1. Install [uv](https://docs.astral.sh/uv/)
2. Clone the repo and `cd` into it
3. `uv sync --all-extras` — install all dependencies
4. `uv run pre-commit install` — set up git hooks
5. `make up` — start the local docker stack

## Workflow

1. Create a feature branch: `git checkout -b feat/your-feature`
2. Make your changes with conventional commits (e.g. `feat(ingestion): add new source`)
3. Ensure tests pass: `make test`
4. Ensure lint passes: `make lint`
5. Open a PR with a clear description

## Conventional Commits

This project uses [Conventional Commits](https://www.conventionalcommits.org/).

Format: `<type>(<scope>)!: <subject>`

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`.

Examples:
- `feat(ingestion): add binance websocket consumer`
- `fix(dbt): correct OHLCV aggregation in fct_trades_minute`
- `docs(readme): update architecture diagram`
- `refactor(airflow)!: migrate to TaskFlow API` (! = breaking change)

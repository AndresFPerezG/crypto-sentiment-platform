# ==========================================================================
# Crypto Sentiment Platform — Makefile
# Run `make help` to see available commands
# ==========================================================================

.DEFAULT_GOAL := help
.PHONY: help install dev up down logs ps clean test lint format type-check \
        pre-commit-install pre-commit-run demo

# ----- Help -----
help: ## Show this help message
	@echo "Crypto Sentiment Platform — Available commands:"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-22s\033[0m %s\n", $$1, $$2}'
	@echo ""

# ----- Setup -----
install: ## Install dependencies with uv
	uv sync --all-extras

dev: install pre-commit-install ## Full dev setup (install + hooks)

pre-commit-install: ## Install pre-commit git hooks
	uv run pre-commit install --install-hooks
	uv run pre-commit install --hook-type commit-msg

# ----- Docker stack -----
up: ## Start all services (Postgres, MinIO, Redpanda)
	docker compose up -d
	@echo "✅ Stack is up. Run 'make ps' to see status."

down: ## Stop all services
	docker compose down

down-volumes: ## Stop services AND remove volumes (DESTRUCTIVE)
	docker compose down -v

logs: ## Tail logs from all services
	docker compose logs -f --tail=100

ps: ## List running services
	docker compose ps

restart: down up ## Restart the stack

# ----- Quality checks -----
lint: ## Run ruff linter
	uv run ruff check .

format: ## Format code with ruff
	uv run ruff format .
	uv run ruff check . --fix

type-check: ## Run mypy strict type checking
	uv run mypy ingestion streaming orchestration

test: ## Run pytest with coverage
	uv run pytest --cov

test-fast: ## Run pytest without coverage (faster)
	uv run pytest --no-cov

pre-commit-run: ## Run all pre-commit hooks against all files
	uv run pre-commit run --all-files

check: lint type-check test ## Run all quality checks (lint + types + tests)

# ----- Demo -----
demo: ## Run the demo Binance ingestor (Week 1 deliverable)
	uv run python -m ingestion.python_scripts.binance_demo

# ----- Cleanup -----
clean: ## Remove cache files and build artifacts
	find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name .pytest_cache -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name .ruff_cache -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name .mypy_cache -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name '*.egg-info' -exec rm -rf {} + 2>/dev/null || true
	rm -rf .coverage htmlcov dist build
	@echo "✅ Cleanup complete"

clean-all: clean down-volumes ## Full cleanup (cache + docker volumes)

.PHONY: help

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

plan: ## Run helmsman in plan mode
	helmsman -f helmsman.yaml

debug: ## Run helmsman in plan mode with debug enabled
	helmsman -f helmsman.yaml --debug

dry-run: ## Run helmsman in dry-run mode with debug enabled
	helmsman -f helmsman.yaml --debug --dry-run

apply: ## Run helmsman in apply mode
	helmsman -f helmsman.yaml --apply

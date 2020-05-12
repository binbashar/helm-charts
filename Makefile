.PHONY: help

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

lint: ## Lint helm charts
	helm lint charts/*

package: ## Package helm charts
	helm package charts/*

index: ## Update the index of this helm repository
	helm repo index --url https://binbashar.github.io/helm-charts/ --merge index.yaml .

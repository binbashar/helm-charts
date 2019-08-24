.PHONY: help

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

decrypt: ## Decrypts secrets.tf via ansible-vault
	ansible-vault decrypt secrets.yaml

encrypt: ## Encrypts secrets.tf via ansible-vault
	ansible-vault encrypt secrets.yaml

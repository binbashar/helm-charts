.PHONY: help

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

decrypt: ## Decrypts secrets.yaml via ansible-vault
	ansible-vault decrypt --output secrets.dec.yaml secrets.yaml

encrypt: ## Encrypts secrets.dec.yaml via ansible-vault
	ansible-vault encrypt --output secrets.yaml secrets.dec.yaml

decrypt-root: ## Decrypts init-root.yaml via ansible-vault
	ansible-vault decrypt init-root.yaml

encrypt-root: ## Encrypts init-root.yaml via ansible-vault
	ansible-vault encrypt init-root.yaml

decrypt-issuer: ## Decrypts init-issuer.yaml via ansible-vault
	ansible-vault decrypt init-issuer.yaml

encrypt-issuer: ## Encrypts init-issuer.yaml via ansible-vault
	ansible-vault encrypt init-issuer.yaml
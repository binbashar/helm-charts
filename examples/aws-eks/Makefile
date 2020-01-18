.PHONY: help
SHELL := /bin/bash

K8S_KUBECTL_CONTEXT := cluster-eks-1.k8s.dev.binbash.aws

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

#==============================================================#
# K8s HELMSMAN                                                 #
#==============================================================#
plan: ## Run helmsman in plan mode to preview any changes
	helmsman -f helmsman.yaml

debug: ## Run helmsman in plan mode showing additional execution logs
	helmsman -f helmsman.yaml --debug

diff:
	helmsman -f helmsman.yaml --show-diff

dry-run: ## Run helmsman in dry-run mode to simulate what will be changed without actually applying
	helmsman -f helmsman.yaml --dry-run

dry-run-debug: ## Run helmsman in dry-run mode showing additional execution logs
	helmsman -f helmsman.yaml --dry-run --debug

apply: ## Run helmsman in apply mode to perform any required changes
	helmsman -f helmsman.yaml --apply

#==============================================================#
# K8s HELM                                                     #
#==============================================================#
helm-list: ## List helm releases
	helm tiller run helm list --kube-context ${K8S_KUBECTL_CONTEXT}

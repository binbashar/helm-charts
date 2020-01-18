.PHONY: help
SHELL := /bin/bash
LOCAL_OS_USER := $(shell whoami)

LOCAL_OS_PWD_DIR := $(shell cd ../../ && pwd)
LOCAL_OS_KUBE_DIR := ~/.kube

DOCKER_IMG_USER = root
DOCKER_IMG_NAME = praqma/helmsman
DOCKER_IMG_TAG  = v1.13.0

K8S_KIND_CLUSTER_NAME := kind-helm
K8s_KIND_NODE_VERSION := v1.13.10
K8S_KIND_KUBECTL_CONFIG_FILE_NAME := kind-config-${K8S_KIND_CLUSTER_NAME}
K8S_KIND_KUBECTL_CONFIG_FILE_PATH := /${DOCKER_IMG_USER}/.kube/${K8S_KIND_KUBECTL_CONFIG_FILE_NAME}
K8S_KIND_KUBECTL_CONTEXT := kubernetes-admin@${K8S_KIND_CLUSTER_NAME}
K8S_KIND_HELMSMAN_CONFIG_FILE_PATH := /tmp/examples/localhost-kind/helmsman.yaml

define K8S_HELMSMAN_CMD_PREFIX
docker run -it --rm \
-v ${LOCAL_OS_KUBE_DIR}:/${DOCKER_IMG_USER}/.kube \
-v ${LOCAL_OS_PWD_DIR}:/tmp:rw \
-e "KUBECONFIG=${K8S_KIND_KUBECTL_CONFIG_FILE_PATH}" \
--network host \
${DOCKER_IMG_NAME}:${DOCKER_IMG_TAG}
endef

define K8S_HELMSMAN_CMD_BASH_PREFIX
docker run -it --rm \
-v ${LOCAL_OS_KUBE_DIR}:/${DOCKER_IMG_USER}/.kube \
-v ${LOCAL_OS_PWD_DIR}:/tmp:rw \
-e "KUBECONFIG=${K8S_KIND_KUBECTL_CONFIG_FILE_PATH}" \
--network host \
--entrypoint=bash ${DOCKER_IMG_NAME}:${DOCKER_IMG_TAG}
endef

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

#==============================================================#
# K8s KIND													   #
#==============================================================#
kind-create-cluster: ## run the create cluster command
	kind version
	kind create cluster --config kind.config.yaml --name ${K8S_KIND_CLUSTER_NAME} --image kindest/node:${K8s_KIND_NODE_VERSION}
	kind get clusters
	kind get kubeconfig-path --name ${K8S_KIND_CLUSTER_NAME}

kind-delete-cluster: ## run the delete cluster command
	kind version
	kind delete cluster --name ${K8S_KIND_CLUSTER_NAME}
	kind get clusters

kind-kubectl-test-cluster: ## docker run kubectl commands
	@echo ''
	${K8S_HELMSMAN_CMD_PREFIX} kubectl version
	@echo ''
	${K8S_HELMSMAN_CMD_PREFIX} kubectl config get-contexts
	@echo ''
	${K8S_HELMSMAN_CMD_PREFIX} kubectl config --kubeconfig=${K8S_KIND_KUBECTL_CONFIG_FILE_PATH} view --minify
	@echo ''
	${K8S_HELMSMAN_CMD_PREFIX} kubectl --context=${K8S_KIND_KUBECTL_CONTEXT} get nodes
	@echo ''
	${K8S_HELMSMAN_CMD_PREFIX} kubectl --context=${K8S_KIND_KUBECTL_CONTEXT} get svc --all-namespaces
	@echo ''
	${K8S_HELMSMAN_CMD_PREFIX} kubectl --context=${K8S_KIND_KUBECTL_CONTEXT} get ingress --all-namespaces
	@echo ''
	${K8S_HELMSMAN_CMD_PREFIX} kubectl --context=${K8S_KIND_KUBECTL_CONTEXT} get  pods --all-namespaces
	@echo ''
	${K8S_HELMSMAN_CMD_PREFIX} kubectl --context=${K8S_KIND_KUBECTL_CONTEXT} get pods --namespace=kube-system

kind-kubectl-k8s-dashboard: ## get kuernestes dashboard access token
	${K8S_HELMSMAN_CMD_PREFIX} kubectl apply -f /tmp/examples/localhost-kind/kubernetes-dashboard/ClusterRoleBinding.yaml
	#${K8S_HELMSMAN_CMD_PREFIX} kubectl -n kube-system describe secret $$(kubectl -n kube-system get secret | awk '/^deployment-controller-token-/{print $$1}') | awk '$$1=="token:"{print $$2}'

#==============================================================#
# K8s HELMSMAN                                                 #
#==============================================================#
plan: ## Run helmsman in plan mode to preview any changes
	${K8S_HELMSMAN_CMD_PREFIX} helmsman -f ${K8S_KIND_HELMSMAN_CONFIG_FILE_PATH}

debug: ## Run helmsman in plan mode showing additional execution logs
	${K8S_HELMSMAN_CMD_PREFIX} helmsman -f ${K8S_KIND_HELMSMAN_CONFIG_FILE_PATH} --debug

diff:
	${K8S_HELMSMAN_CMD_PREFIX} helmsman -f ${K8S_KIND_HELMSMAN_CONFIG_FILE_PATH} --show-diff

dry-run: ## Run helmsman in dry-run mode to simulate what will be changed without actually applying
	${K8S_HELMSMAN_CMD_PREFIX} helmsman -f ${K8S_KIND_HELMSMAN_CONFIG_FILE_PATH} --dry-run

dry-run-debug: ## Run helmsman in dry-run mode showing additional execution logs
	${K8S_HELMSMAN_CMD_PREFIX} helmsman -f ${K8S_KIND_HELMSMAN_CONFIG_FILE_PATH} --dry-run --debug

apply: ## Run helmsman in apply mode to perform any required changes
	${K8S_HELMSMAN_CMD_PREFIX} helmsman -f ${K8S_KIND_HELMSMAN_CONFIG_FILE_PATH} --apply

helmsman-bash: ## docker run helmsman bash
	${K8S_HELMSMAN_CMD_BASH_PREFIX}

helmsman-clean:
	sudo rm -rf ../../.helmsman-tmp

#==============================================================#
# K8s HELM                                                     #
#==============================================================#
helm-list: ## List helm releases
	${K8S_HELMSMAN_CMD_PREFIX} helm tiller run helm list --kube-context ${K8S_KIND_KUBECTL_CONTEXT}
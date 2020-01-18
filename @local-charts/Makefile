.PHONY: help
SHELL := /bin/bash

LOCAL_OS_PWD_DIR := $(shell cd ../ && pwd)
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

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

#==============================================================#
# K8s HELM                                                     #
#==============================================================#
helm-install-dry-run: ## dry-run of a helm install and enable debug to inspect the generated definitions
	${K8S_HELMSMAN_CMD_PREFIX} helm tiller run helm install --dry-run --debug @local-charts/onetimesecret
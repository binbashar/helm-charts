.PHONY: help
SHELL                  := /bin/bash
LOCAL_OS_USER_ID       := $(shell id -u)
LOCAL_OS_GROUP_ID      := $(shell id -g)

HELM_PWD_DIR           := $(shell pwd)
HELM_VER               := v2.16.7
HELM_PWD_CONT_DIR      := "/root/.helm/repository/local"
HELM_DOCKER_IMAGE      := lachlanevenson/k8s-helm

define HELM_CMD
docker run --rm \
-v ${HELM_PWD_DIR}:${HELM_PWD_CONT_DIR}:rw \
-w ${HELM_PWD_CONT_DIR} \
-it ${HELM_DOCKER_IMAGE}:${HELM_VER}
endef

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

#==============================================================#
# HELM                                                         #
#==============================================================#
helm-dir-chmod: ## run chown in ./.terraform to gran that the docker mounted dir has the right permissions
	@echo LOCAL_OS_USER_ID: ${LOCAL_OS_USER_ID}
	@echo LOCAL_OS_GROUP_ID: ${LOCAL_OS_GROUP_ID}
	sudo chown -R ${LOCAL_OS_USER_ID}:${LOCAL_OS_GROUP_ID} ./

lint: ## Lint helm charts
	${HELM_CMD} lint charts/*

package: package-cmd helm-dir-chmod ## Package helm charts
package-cmd:
	${HELM_CMD} package charts/*
	mv *.tgz ./packages
	${HELM_CMD} repo index --url https://binbashar.github.io/helm-charts/ --merge index.yaml .

package-release: package-release-cmd helm-dir-chmod ## Package helm charts
package-release-cmd:
	${HELM_CMD} package charts/*
	mv *.tgz ./packages
	${HELM_CMD} repo index --url https://binbashar.github.io/helm-charts/ --merge index.yaml .
	git status
	git add index.yaml
	git add packages
	git commit -m "Releasing latest Helm Chart versions [ci skip]"
	git push origin master

index: index-cmd helm-dir-chmod ## Update the index of this helm repository
index-cmd:
	${HELM_CMD} repo index --url https://binbashar.github.io/helm-charts/ --merge index.yaml .

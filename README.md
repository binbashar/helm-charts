<div align="center">
    <img src="https://raw.githubusercontent.com/binbashar/helm-charts/master/figures/binbash.png" alt="drawing" width="350"/>
</div>
<div align="right">
  <img src="https://raw.githubusercontent.com/binbashar/helm-charts/master/figures/binbash-leverage-helm.png" alt="leverage" width="230"/>
</div>

# helm-charts

![GitHub](https://img.shields.io/github/license/binbashar/helm-charts.svg)
![GitHub language count](https://img.shields.io/github/languages/count/binbashar/helm-charts.svg)
![GitHub top language](https://img.shields.io/github/languages/top/binbashar/helm-charts.svg)
![GitHub repo size](https://img.shields.io/github/repo-size/binbashar/helm-charts.svg)
![GitHub issues](https://img.shields.io/github/issues/binbashar/helm-charts.svg)
![GitHub closed issues](https://img.shields.io/github/issues-closed/binbashar/helm-charts.svg)
![GitHub pull requests](https://img.shields.io/github/issues-pr/binbashar/helm-charts.svg)
![GitHub closed pull requests](https://img.shields.io/github/issues-pr-closed/binbashar/helm-charts.svg)
![GitHub release](https://img.shields.io/github/release/binbashar/helm-charts.svg)
![GitHub Release Date](https://img.shields.io/github/release-date/binbashar/helm-charts.svg)
![GitHub contributors](https://img.shields.io/github/contributors/binbashar/helm-charts.svg)

![GitHub followers](https://img.shields.io/github/followers/binbashar.svg?style=social)
![GitHub forks](https://img.shields.io/github/forks/binbashar/helm-charts.svg?style=social)
![GitHub stars](https://img.shields.io/github/stars/binbashar/helm-charts.svg?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/binbashar/helm-charts.svg?style=social)

# Overview
This repository holds infrastructure that we deploy to our clusters via Helm + Helmsman.

# Requirements

## Install Helm and Helmsman
- Install Helm: check official documentation (https://github.com/helm/helm) for all recommended ways
- Install Helmsman: check official documentation (https://github.com/Praqma/helmsman) for all recommended ways

## Use a Tiller-less setup
- Install tiller plugin to use a tiller-less approach
```
helm plugin install https://github.com/rimusz/helm-tiller
```

## Add Helmsman requirements
- Install helm-diff plugin:
```
helm plugin install https://github.com/databus23/helm-diff --version master
```

# Files and Directories
- There are only two types of directories `charts` and environments such as `dev` or `prd`
- Charts directory contains local charts that later on can be moved to a separate repository
- Environment directories contain the Helmsman's desired state file that define what charts are deployed to each environment


# Typical Workflows

## Add or remove charts to an environment
- Go to the directory of the environment you need to work with (dev, stg, prd, ...)
- Edit `helmsman.yaml` to add/remove any charts you need
- Run helmsman in plan mode to preview your changes: `make plan`
- Review the plan to make sure helmsman will apply the changes you expect
- Run helmsman in apply mode: `make apply`

## Add charts
- Go to the `charts` directory
- Create your chart (you can use helm and a local cluster using minikube, kind, k3d, ...)
- You have a number of options for creating charts:
  - You could create your chart from scratch
  - You could copy existing manifests and use that as your chart
  - You could start from existing manifests and add customizations as you go
  - You could take an existing chart that you modify to your needs
- Use helm to tune your chart as you like
- Once you are done you can move on to add your chart to any of the environments in this repository

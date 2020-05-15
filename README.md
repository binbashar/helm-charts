<div align="center">
    <img src="https://raw.githubusercontent.com/binbashar/helm-charts/master/@doc/figures/binbash-logo.png" 
    alt="drawing" width="250"/>
</div>
<div align="right">
  <img src="https://raw.githubusercontent.com/binbashar/helm-charts/master/@doc/figures/binbash-leverage-helm-logo.png" 
  alt="leverage" width="130"/>
</div>

# helm-charts

![GitHub followers](https://img.shields.io/github/followers/binbashar.svg?style=social)
![GitHub forks](https://img.shields.io/github/forks/binbashar/helm-charts.svg?style=social)
![GitHub stars](https://img.shields.io/github/stars/binbashar/helm-charts.svg?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/binbashar/helm-charts.svg?style=social)

# Overview
This is BinBash' Helm Charts repository.

# Files Structure
* charts/               => This is where you can find the charts code.
* packages/index.yaml   => The index of the repository. It has information about all available charts.
* Makefile              => A simple helper for typical tasks of this Helm repository.

# Chart Development Workflow
* Create your new chart in the charts/ directory or modify an existing chart
* Make sure you update the Chart.yaml file of your chart to reflect the new version

# Chart Release Workflow
* Lint charts: `make lint`
* Package charts: `make package`
* Update index file: `make index`

# Release Management
### CircleCi PR auto-release job

<div align="left">
  <img src="https://raw.githubusercontent.com/binbashar/helm-charts/master/@doc/figures/circleci-logo.png" alt="circleci" width="130"/>
</div>

- [**pipeline-job**](https://circleci.com/gh/binbashar/helm-charts) (**NOTE:** Will only run after merged PR)
- [**releases**](https://github.com/binbashar/helm-charts/releases)
- [**changelog**](https://github.com/binbashar/helm-charts/blob/master/CHANGELOG.md)

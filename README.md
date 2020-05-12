<div align="center">
    <img src="https://raw.githubusercontent.com/binbashar/helm-charts/master/figures/binbash.png" alt="drawing" width="350"/>
</div>
<div align="right">
  <img src="https://raw.githubusercontent.com/binbashar/helm-charts/master/figures/binbash-leverage-helm.png" alt="leverage" width="230"/>
</div>

# helm-charts

![GitHub followers](https://img.shields.io/github/followers/binbashar.svg?style=social)
![GitHub forks](https://img.shields.io/github/forks/binbashar/helm-charts.svg?style=social)
![GitHub stars](https://img.shields.io/github/stars/binbashar/helm-charts.svg?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/binbashar/helm-charts.svg?style=social)

# Overview
This is BinBash' Helm Charts repository.

# Files Structure
* charts/         => This is where you can find the charts code.
* index.yaml      => The index of the repository. It has information about all available charts.
* Makefile        => A simple helper for typical tasks of this Helm repository.

# Chart Development Workflow
* Create your new chart in the charts/ directory or modify an existing chart
* Make sure you update the Chart.yaml file of your chart to reflect the new version

# Chart Release Workflow
* Lint charts: `make lint`
* Package charts: `make package`
* Update index file: `make index`

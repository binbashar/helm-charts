<div align="center">
    <img src="https://raw.githubusercontent.com/binbashar/helm-charts/master/figures/binbash.png" alt="drawing" width="350"/>
</div>
<div align="right">
  <img src="https://raw.githubusercontent.com/binbashar/helm-charts/master/figures/binbash-leverage-helm.png" alt="leverage" width="230"/>
</div>

# helm-charts

[![CircleCI](https://circleci.com/gh/binbashar/helm-charts.svg?style=svg)](https://circleci.com/gh/binbashar/helm-charts)

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


# Release Management

## Docker based makefile commands
- https://cloud.docker.com/u/binbash/repository/docker/binbash/git-release
- https://github.com/binbashar/helm-charts/blob/master/Makefile

Root directory `Makefile` has the automated steps (to be integrated with **CircleCI jobs** []() )

### CircleCi PR auto-release job
- https://circleci.com/gh/binbashar/helm-charts
- **NOTE:** Will only run after merged PR.

### Manual execution from workstation
```
$ make
Available Commands:
 - release-major-with-changelog make changelog-major && git add && git commit && make release-major
 - release-minor-with-changelog make changelog-minor && git add && git commit && make release-minor
 - release-patch-with-changelog make changelog-patch && git add && git commit && make release-patch
 ```

Sample execution output:
```
# delivery @ delivery-I7567 in ~/Binbash/repos/BB-Leverage/helm/helm-charts on git:master o [20:06:43]
$ make release-patch-with-changelog

make[1]: Entering directory '/home/delivery/Binbash/repos/BB-Leverage/helm/helm-charts'
docker run --rm -v /home/delivery/Binbash/repos/BB-Leverage/helm/helm-charts:/data -it binbash/git-release -o CHANGELOG.md --next-tag v0.0.7
⌚️  Generating changelog ...
✨  Generate of "CHANGELOG.md" is completed! (18.360179ms)
sudo chown -R delivery:delivery ./.chglog
sudo chown -R delivery:delivery ./CHANGELOG.md

make[1]: Leaving directory '/home/delivery/Binbash/repos/BB-Leverage/helm/helm-charts'
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   CHANGELOG.md

no changes added to commit (use "git add" and/or "git commit -a")
[master 62ed47f] Updating CHANGELOG.md via make changelog-patch for v0.0.7
 1 file changed, 5 insertions(+), 1 deletion(-)
Counting objects: 3, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 392 bytes | 0 bytes/s, done.
Total 3 (delta 2), reused 0 (delta 0)
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To git@github.com:binbashar/helm-charts.git
   f579566..62ed47f  master -> master

make[1]: Entering directory '/home/delivery/Binbash/repos/BB-Leverage/helm/helm-charts'
# pre-req -> https://github.com/pnikosis/semtag
docker run --rm -v /home/delivery/Binbash/repos/BB-Leverage/helm/helm-charts:/data:rw -v ~/.ssh:/root/.ssh -v ~/.gitconfig:/etc/gitconfig --entrypoint=/opt/semtag/semtag/semtag -it binbash/git-release get
Current final version: v0.0.6
Last tagged version:   v0.0.6

docker run --rm -v /home/delivery/Binbash/repos/BB-Leverage/helm/helm-charts:/data:rw -v ~/.ssh:/root/.ssh -v ~/.gitconfig:/etc/gitconfig --entrypoint=/opt/semtag/semtag/semtag -it binbash/git-release final -s patch
Counting objects: 1, done.
Writing objects: 100% (1/1), 277 bytes | 0 bytes/s, done.
Total 1 (delta 0), reused 0 (delta 0)
To github.com:binbashar/helm-charts.git
 * [new tag]         v0.0.7 -> v0.0.7
v0.0.7
make[1]: Leaving directory '/home/delivery/Binbash/repos/BB-Leverage/helm/helm-charts'
```
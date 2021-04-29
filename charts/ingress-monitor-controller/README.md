# ingress-monitor-controller

![Version: v2.0.14](https://img.shields.io/badge/Version-v2.0.14-informational?style=flat-square)

Ingress Monitor Controller chart that runs on kubernetes

**Homepage:** <https://github.com/stakater/IngressMonitorController>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Binbash Leverage Team | leverage@binbash.com.ar | https://binbash.com.ar |
| Luis Gallardo | luis.gallardo@binbash.com.ar | https://binbash.com.ar |

## Source Code

* <https://github.com/stakater/IngressMonitorController>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| ingressMonitorController.config.labels.version | string | `"v2.0.14"` |  |
| ingressMonitorController.configFilePath | string | `"/etc/IngressMonitorController/config.yaml"` |  |
| ingressMonitorController.configSecretName | string | `"imc-config"` |  |
| ingressMonitorController.data."config.yaml" | string | `"providers:\n  - name: UptimeRobot\n    apiKey: 657a68d9ashdyasjdklkskuasd\n    apiURL: https://api.uptimerobot.com/v2/\n    alertContacts: \"0544483_0_0-2628365_0_0-2633263_0_0\"\nenableMonitorDeletion: true"` |  |
| ingressMonitorController.deployment.annotations."configmap.reloader.stakater.com/reload" | string | `"ingressmonitorcontroller"` |  |
| ingressMonitorController.deployment.labels.version | string | `"v2.0.14"` |  |
| ingressMonitorController.image.name | string | `"stakater/ingressmonitorcontroller"` |  |
| ingressMonitorController.image.pullPolicy | string | `"Always"` |  |
| ingressMonitorController.image.tag | string | `"v2.0.14"` |  |
| ingressMonitorController.logFormat | string | `"text"` |  |
| ingressMonitorController.logLevel | string | `"info"` |  |
| ingressMonitorController.matchLabels.group | string | `"com.stakater.platform"` |  |
| ingressMonitorController.matchLabels.provider | string | `"stakater"` |  |
| ingressMonitorController.rbac.create | bool | `true` |  |
| ingressMonitorController.serviceAccount.create | bool | `true` |  |
| ingressMonitorController.useFullName | bool | `false` |  |
| ingressMonitorController.watchNamespace | string | `""` |  |
| kubernetes.host | string | `"https://kubernetes.default"` |  |


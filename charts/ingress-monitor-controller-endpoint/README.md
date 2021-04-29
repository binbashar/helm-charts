# ingress-monitor-controller-endpoint

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square)

A Helm chart to install Ingress Monitor Controller endpoints

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Binbash Leverage Team | leverage@binbash.com.ar | https://leverage.binbash.com.ar |
| Luis Gallardo | luis.gallardo@binbash.com.ar | https://leverage.binbash.com.ar |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| endpoint.forceHttps | bool | `true` |  |
| endpoint.name | string | `"example.com"` |  |
| endpoint.provider.interval | int | `600` |  |
| endpoint.provider.monitorType | string | `"http"` |  |
| endpoint.provider.name | string | `"uptimeRobot"` |  |
| endpoint.type | string | `"url"` |  |
| endpoint.url | string | `"https://example.com"` |  |


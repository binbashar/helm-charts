# raw

This chart takes a list of Kubernetes resources and
merges each resource with a default `metadata.labels` map and installs
the result.

The Kubernetes resources can be "raw" ones defined under the `resources` key, or "templated" ones defined under the `templates` key.

Some use cases for this chart include Helm-based installation and
maintenance of resources of kinds:
- LimitRange
- PriorityClass
- Secret

## Usage

### Raw resources

#### STEP 1: Create a yaml file containing your raw resources.

```
# raw-priority-classes.yaml
resources:
  - apiVersion: scheduling.k8s.io/v1beta1
    kind: PriorityClass
    metadata:
      name: common-critical
    value: 100000000
    globalDefault: false
    description: "This priority class should only be used for critical priority common pods."
```

#### STEP 2: Install your raw resources.

```
helm install raw-priority-classes binbashar/raw -f raw-priority-classes.yaml
```

### Templated resources

#### STEP 1: Create a yaml file containing your templated resources.

```
# values.yaml

templates:
- |
  apiVersion: v1
  kind: Secret
  metadata:
    name: common-secret
  stringData:
    mykey: {{ .Values.mysecret }}
```

#### STEP 2: Install your templated resources.

```
helm install mysecret binbashar/raw -f values.yaml
```

### On Terraform using Helm provider

``` terraform
resource "helm_release" "external_secrets_cluster_store" {
  depends_on = [helm_release.external_secrets]

  name       = "external-secrets-cluster-store"
  repository = "https://binbashar.github.io/helm-charts/"
  chart      = "raw"
  version    = "0.1.0"
  values = [
    <<-EOF
    resources:
      - apiVersion: external-secrets.io/v1beta1
        kind: ClusterSecretStore
        metadata:
          name: cluster-store
        spec:
          ... further contents of the ClusterSecretStore omitted ...
    EOF
  ]
}
```

## Credits

 - Based on https://github.com/itscontained/charts/tree/master/itscontained/raw
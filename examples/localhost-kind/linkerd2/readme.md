# Linkerd2 PKI

# About the files in this directory
* All of the .yaml files are encrypted and must remain like that when committed to the repository
* `secrets.yaml` holds the values passed to Linkerd2 chart
* `init-root.yaml` contains the root CA, that is its certificate and private key
* `init-issuer.yaml` contains the intermediate certificate and private key that is used by Linkerd2 to issue the certificates that enable mutual TLS
* Root CA and intermediate certificate were generated according this: https://linkerd.io/2/tasks/generate-certificates/

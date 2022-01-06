# hello-k8s-app
A simple hello app deployed in a kubernetes cluster running on an arm64 architecture.

## Installation

```bash
helm repo add hello-k8s-app https://holzeis.github.io/hello-k8s-app
helm install hello-k8s-app hello-k8s-app/hello-k8s-app -f values.yaml # create your own values.yaml
```

See [values.yaml](charts/hello-k8s-app/values.yaml) for helm chart configurations.

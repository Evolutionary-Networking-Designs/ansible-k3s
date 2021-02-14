# Install Rancher on a Kubernetes Cluster

## Install Pre-requisites

- https://github.com/helm/helm

## Add the Helm Chart Repository

```bash
helm repo add rancher-stable https://releases.rancher.com/server-charts/stable
```

## Create a Namespace for Rancher

```bash
kubectl create namespace cattle-system
```

## Install cert-manager

```bash
# Install the CustomResourceDefinition resources separately
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.0.4/cert-manager.crds.yaml

# **Important:**
# If you are running Kubernetes v1.15 or below, you
# will need to add the `--validate=false` flag to your
# kubectl apply command, or else you will receive a
# validation error relating to the
# x-kubernetes-preserve-unknown-fields field in
# cert-manager’s CustomResourceDefinition resources.
# This is a benign error and occurs due to the way kubectl
# performs resource validation.

# Create the namespace for cert-manager
kubectl create namespace cert-manager

# Add the Jetstack Helm repository
helm repo add jetstack https://charts.jetstack.io

# Update your local Helm chart repository cache
helm repo update

# Install the cert-manager Helm chart
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --version v1.0.4
```

Validate cert-manager is running

```bash
kubectl get pods --namespace cert-manager
```

## Install Rancher

```bash
export RANCHER.DNS=rancher.dev

helm install rancher rancher-stable/rancher \
  --namespace cattle-system \
  --set hostname=$RANCHER_DNS
```

Wait for rancher to be rolled out.

```bash
kubectl -n cattle-system rollout status deploy/rancher
```

Final command to verify deployment

```bash
kubectl -n cattle-system get deploy rancher
```

## Reference

https://rancher.com/docs/rancher/v2.x/en/installation/
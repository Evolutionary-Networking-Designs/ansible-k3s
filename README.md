# Kubernetes Cluster Build Automation

## Tested OS Images

Ubuntu 20.04 LTS (arm64)

## Required python packages

```bash
pip3 install openshift
```

## This project uses the following role from Ansible Galaxy

```bash
ansible-galaxy install xanmanning.k3s
```

## This project uses the following plugins from Ansible Galaxy

```bash
ansible-galaxy collection install community.kubernetes
```

## History

This project was built for a cluster of 7 Rasberry Pi Model 4B (8 GB Ram) nodes.

## Usage

### Configure Environment

Run the configure playbooks to prepare for cluster deployment

```bash
make configure
```

### Setup Cluster

```bash
make install
```

#### Check deployment of rancher

```bash
kubectl -n cattle-system rollout status deploy/rancher
```

### WARNING: The next command ERASES the cluster

```bash
make uninstall
```

## Common Commands

Common commands have been added to the Makefile

### Ping Hosts

```bash
make ping
```

### Patch Hosts

```bash
make update
```

### Backup Cluster State

```bash
make backup
```

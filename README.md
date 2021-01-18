# Kubernetes Cluster Build Automation

## Tested OS Images

Ubuntu 20.04 LTS (arm64)

## This project uses the following role from Ansible Galaxy

```bash
ansible-galaxy install xanmanning.k3s
```

## History

This project was built for a cluster of 7 Rasberry Pi Model 4B (8 GB Ram) nodes.

## Usage

The playbooks should be run in the following order:

```bash
ansible-playbook 01_update_hostnames.yml
ansible-playbook 02_update_hosts.yml
ansible-playbook 03_update_kernel_cmdline.yml
ansible-playbook 04_build_k3s_cluster.yml
ansible-playbook 05_set_timezone.yml
```

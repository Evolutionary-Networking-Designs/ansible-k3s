ping:
	ansible -m ping cluster	
update:
	ansible-playbook 02_update_hosts.yml
configure:
	ansible-playbook 01_update_hostnames.yml
	ansible-playbook 02_update_hosts.yml
	ansible-playbook 03_update_kernel_cmdline.yml
	ansible-playbook 04_set_timezone.yml
install:
	ansible-playbook 05_build_k3s_cluster.yml
	ansible-playbook 06_get_kubeconfig.yml
	ansible-playbook 07_install_rancher.yml
uninstall:
	ansible-playbook 00_uninstall_k3s_cluster.yml
backup:
	ansible-playbook 99_backup_etcd_snapshot.yml

ping:
	ansible -m ping cluster	
update:
	ansible-playbook 02_update_hosts.yml
install:
	ansible-playbook 04_build_k3s_cluster.yml
uninstall:
	ansible-playbook 00_uninstall_k3s_cluster.yml
backup:
	ansible-playbook 99_backup_etcd_snapshot.yml

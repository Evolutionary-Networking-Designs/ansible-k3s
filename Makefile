ping:
	ansible -m ping cluster	
update:
	ansible-playbook 02_update_hosts.yml
backup:
	ansible-playbook 06_backup_etcd_snapshot.yml

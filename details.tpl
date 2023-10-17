[docker_servers]
master01 ansible_port=22 ansible_host=${master01}  ansible_user=ansibleadmin ansible_ssh_private_key_file=/root/ansibleadmin.pem 
master02 ansible_port=22 ansible_host=${master02}  ansible_user=ansibleadmin ansible_ssh_private_key_file=/root/ansibleadmin.pem
master03 ansible_port=22 ansible_host=${master03}  ansible_user=ansibleadmin ansible_ssh_private_key_file=/root/ansibleadmin.pem 
worker01 ansible_port=22 ansible_host=${worker01}  ansible_user=ansibleadmin ansible_ssh_private_key_file=/root/ansibleadmin.pem 
worker02 ansible_port=22 ansible_host=${worker02}  ansible_user=ansibleadmin ansible_ssh_private_key_file=/root/ansibleadmin.pem 
worker03 ansible_port=22 ansible_host=${worker03}  ansible_user=ansibleadmin ansible_ssh_private_key_file=/root/ansibleadmin.pem 

[docker_master]
${master01}

[docker_managers]
${master02}
${master03}

[docker_workers]
${worker01}
${worker02}
${worker03}



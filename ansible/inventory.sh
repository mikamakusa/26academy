#!/bin/bash

python ../terraform/digitalocean.py --list > /opt/inventory.json

echo "[docker]" > ansible/inventory.ini

END=5
for (( i = 2; i < $END; i++ )); do
	name=$(cat /opt/inventory.json | jq -r ".[$i].name")
	ip=$(cat /opt/inventory.json | jq -r ".[$i].networks.v4[].ip_address")

	echo $name ansible_ssh_host=$ip ansible_ssh_private_key_file=ssh_keys/ssh_keys/26apro2 ansible_user=root >> ansible/inventory.ini
done
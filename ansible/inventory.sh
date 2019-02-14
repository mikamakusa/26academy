#!/bin/bash

echo [docker] > ansible/inventory.ini
python ansible/digitalocean.py --droplets | jq -r '.droplets[] | .name +" ansible_ssh_host="+ .networks.v4[].ip_address' >> ansible/inventory.ini
sed -i '/blog1/d' ansible/inventory.ini && sed -i '/bastion/d' ansible/inventory.ini
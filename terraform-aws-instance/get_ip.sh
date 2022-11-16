#! /bin/bash
terraform plan --auto-approve
export IP=$(terraform output | cut -d " " -f 3 | tr -d " " )
echo "[web]" > ./ansbile/deploy/inventory

for i in $IP;
do
echo "web${i} ansible_host=$i ansible_user=ubuntu ansible_ssh_private_key_file=/home/hoosam/key/ansible.pem" >> ./ansbile/deploy/inventory 
echo 'ip'
done

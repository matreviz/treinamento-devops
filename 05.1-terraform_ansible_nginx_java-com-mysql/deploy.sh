#!/bin/bash
cd ~/treinamento-devops/05.1-terraform_ansible_nginx_java-com-mysql

cd terraform
terraform init
terraform apply -auto-approve

echo  "Aguardando a criação das maquinas ..."
sleep 5

HOST_DNS=$(cd ~/treinamento-devops/05.1-terraform_ansible_nginx_java-com-mysql/terraform/ & terraform output | grep 'PUBLIC_DNS=' | awk '{print $1;exit}' | cut -b 13- | sed "s/\",//g")

echo "
[ec2-java]
$HOST_DNS
" > ../ansible/hosts

cd ../ansible

ANSIBLE_HOST_KEY_CHECKING=False
USER=root PASSWORD=root DATABASE=SpringWebYoutube ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key ~/.ssh/id_teste

# echo  "Abrindo site no navegador"
# sleep 10

# open "http://$HOST_DNS"

# echo  "Acessando via SH"
# sleep 5
# ssh -i ~/Desktop/devops/treinamentoItau ubuntu@$HOST_DNS -o ServerAliveInterval=60
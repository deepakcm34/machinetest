#!/bin/bash

echo "My name is Deepak, This script will help you to configure a VPC and kubernetes cluster in AWS using Terraform. It will also deploy a Wordpress website and the EFK logging"

sleep 5s


>/root/kube-scripts/out.txt
bash read.sh

echo "Enter your clustername once again"

read clusternameagain

echo "Enter the hosted zone in route53 again"

read hostedzoneroute

cd aws-vpc_back

terraform init

sleep 5s
terraform apply --var-file example.tfvars -auto-approve  >> output.txt

sleep 10s

cat output.txt | grep id=subnet | awk {'print $6'} | cut -d "=" -f2 | cut -d "]" -f1  >> /root/kube-scripts/out.txt

>output.txt

cd ..

echo "wait"

sleep 5s

cd aws-kube_back

touch 1.txt

sleep 3s

echo "temp file created"

sed -n 1p /root/kube-scripts/out.txt  > 1.txt 

cat 1.txt | while read -r line; do  sed -i "s|MASTER|$line|g" example.tfvars;  done

cat 1.txt | while read -r line; do  sed -i "s|NODE1|$line|g" example.tfvars; done

cat 1.txt | while read -r line; do  sed -i "s|NODE2|$line|g" example.tfvars; rm -rf 1.txt; done

sleep 5s

echo "replaced"

sleep 20s

terraform init

sleep 5s

terraform apply --var-file example.tfvars -auto-approve


cd ..

echo " Please wait !!! .. Your Environment is getting ready"

>out.txt

sleep 180s

rm -rf /root/.kube

mkdir /root/.kube

scp -o StrictHostKeyChecking=no centos@$clusternameagain.$hostedzoneroute:/home/centos/kubeconfig  /root/.kube/config

sleep 5s

cd policy

terraform init

terraform apply -auto-approve

echo "Please hold on"

sleep 20s

echo "The Environment is ready!!!"

#!/bin/bash

echo "Enter your Region"

read reg 

echo "Enter your First Zone"

read zonea

echo "Enter your Second Zone"

read zoneb

echo "Enter your Third Zone"

read zonec

echo "Enter your clustername"

read name

echo "Enter your Mater Instance Type"

read masterinsta

echo "Enter your Node Instance Type"

read nodeinsta

echo "Enter you vpc name"

read vpc

echo " Enter minimum node count"

read mcount

echo " Enter maximum Node count"

read ncount

echo "Enter the hosted zone in route53"

read hostedzone

echo "Please confirm the details: "

echo "Your Region is $reg"

echo "Your First Zone is $zonea"

echo "Your Second Zone is $zoneb"

echo "Your Third Zone is $zonec"

echo "Your clustername : $name"

echo "Your Mater Instance Type: $masterinsta"

echo "Your Node Instance Type: $nodeinsta"

echo "You vpc name: $vpc"

echo "Minimum node count: $mcount"

echo "Maximum Node count: $ncount"

echo "The hosted zone in route53: $hostedzone"

sleep 20s

sed -i "s|REG|$reg|g" aws-vpc_back/example.tfvars
sed -i "s|VPCNAME|$vpc|g" aws-vpc_back/example.tfvars
sed -i "s|ZONEA|$zonea|g" aws-vpc_back/example.tfvars
sed -i "s|ZONEB|$zoneb|g" aws-vpc_back/example.tfvars
sed -i "s|ZONEC|$zonec|g" aws-vpc_back/example.tfvars


sed -i "s|REG|$reg|g" aws-kube_back/example.tfvars
sed -i "s|MIN|$mcount|g" aws-kube_back/example.tfvars
sed -i "s|MAX|$ncount|g" aws-kube_back/example.tfvars
sed -i "s|NAME|$name|g" aws-kube_back/example.tfvars
sed -i "s|HOSTEDZONEDOMAIN|$hostedzone|g" aws-kube_back/example.tfvars
sed -i "s|MASTERTYPE|$masterinsta|g" aws-kube_back/example.tfvars
sed -i "s|NODETYPE|$nodeinsta|g" aws-kube_back/example.tfvars
sed -i "s|REG|$reg|g" aws-kube_back/variables.tf
sed -i "s|MASTERTYPE|$masterinsta|g" aws-kube_back/variables.tf
sed -i "s|NODETYPE|$nodeinsta|g" aws-kube_back/variables.tf
sed -i "s|IAMROLE|$name|g" policy/policy.tf

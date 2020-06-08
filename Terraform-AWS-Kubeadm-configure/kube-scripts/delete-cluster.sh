#!/bin/bash

cd policy

terraform destroy -auto-approve

sleep 20s

cd ..

cd aws-kube_back

terraform destroy --var-file example.tfvars -auto-approve

sleep 20s

cd ..

cd aws-vpc_back

terraform destroy --var-file example.tfvars -auto-approve

sleep 20s


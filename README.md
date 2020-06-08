# Machine test

The folder "es" contains the yaml files to build the elastic cluster

The folder "kibana" contains the fluentd and kibana deployment yamls

The folder "config" contains the Kubernetes cluster configuration yamls

The folder "Terraform-AWS-Kubeadm-configure/kube-scripts" contains the Terraform files and the bash scripts to initiate and delete the whole environment

NB: You do not have to do any manual setup in-order to build this cluster. I have created a bash script to automate and build all the infra using the terraform. Also I have mentioned the yaml URLs using this repo, so that you do not have to download the yaml files to your bastion host.

# The things you need to setup before initiating the script:

1: Create a bastion host in your AWS account.

2: Configure the aws in the bastion host using the access and secret key.

3: Install the Terraform v0.12.26 in the bastion host

3: Create a file "/root/kube-scripts/out.txt" in your bastion host (This is to cut the subnets for the VPC)

4: Add a zone in the route53

Once you setup all the above 3, you can clone the git repo to your bastion host.

git clone https://github.com/deepakcm34/machinetest.git


Please follow the below steps to build the infra :

1 : Go to the directory "Terraform-AWS-Kubeadm-configure/kube-scripts".

2: Execute the bash script "init.sh" : ./init.sh
   
    The script "init.sh" will ask you to enter the variables which need to build the cluster using another script "read.sh"(eg: region,instance type etc). Once you enter the details, the bash script "read.sh" will replace the variables in the terraform tf/tfvars files. After that, "init.sh" will first execute the terraform under "aws-vpc_back" where the VPC tf files are placed. Once the VPC creation completes, it will cut the subnets and add to the file "/root/kube-scripts/out.txt".
   
    the script will select one subnet from "/root/kube-scripts/out.txt"  and replace it with the master and node subnets mentioned in the "aws-kube_back/example.tfvars". After that, the bash script will execute the terraform under "aws-kube_back" with the var file "example.tfvars" in-order to build the kubernetes environment including the EFK and wordpress using the Loadbalancer type.
   

Once the cluster is created, you can download the kubectl client (Refer the link to get the latest client "https://kubernetes.io/docs/tasks/tools/install-kubectl/") into your bastion host. Also please confirm whether the config file is copied to the path "/root/.kube/config", if not, please copy and paste the config file from the master to bastion host.

check the nodes and pods:

kubectl get nodes
kubectl get po

Check and confirm the services which will give you the loadbalancer URL for your wordpress and Kibana:

kubectl get svc

It will take some time to complete the loadbalancer.

once done, you can access the kibana using the corresponding loadbalancer-cname with port 5601. You can access the wordpress using the default httpd port 80.





# AWS region where should the AWS Kubernetes be deployed
aws_region    = "REG"

# Name for AWS resources
cluster_name  = "NAME"

# Instance types for mster and worker nodes
master_instance_type = "MASTERTYPE"
worker_instance_type = "NODETYPE"

# SSH key for the machines
ssh_public_key = "~/.ssh/id_rsa.pub"

# Subnet IDs where the cluster should run (should belong to the same VPC)
# - Master can be only in single subnet
# - Workers can be in multiple subnets
# - Worker subnets can contain also the master subnet
master_subnet_id = "MASTER"
worker_subnet_ids = [		
    "MASTER",
    "NODE1",
    "NODE2"
]

# Number of worker nodes
min_worker_count = MIN
max_worker_count = MAX

# DNS zone where the domain is placed
hosted_zone = "HOSTEDZONEDOMAIN"
hosted_zone_private = false

# Tags
tags = {
  Application = "NAME"
}

# Tags in a different format for Auto Scaling Group
tags2 = [
  {
    key                 = "Application"
    value               = "NAME"
    propagate_at_launch = true
  }
]


addons = [
  "https://raw.githubusercontent.com/deepakcm34/machinetest/master/config/storage-class.yaml",
  "https://raw.githubusercontent.com/deepakcm34/machinetest/master/config/metrics-server.yaml",
  "https://raw.githubusercontent.com/deepakcm34/machinetest/master/config/dashboard.yaml",
  "https://raw.githubusercontent.com/deepakcm34/machinetest/master/config/external-dns.yaml",
  "https://raw.githubusercontent.com/deepakcm34/machinetest/master/secret.yaml",
  "https://raw.githubusercontent.com/deepakcm34/machinetest/master/wordpress-deployment-1.yaml",
  "https://raw.githubusercontent.com/deepakcm34/machinetest/master/wordpress-mysql-deployment.yaml",
  "https://raw.githubusercontent.com/deepakcm34/machinetest/master/config/autoscaler.yaml",
  "https://raw.githubusercontent.com/deepakcm34/machinetest/master/es/es-svc.yaml",
  "https://raw.githubusercontent.com/deepakcm34/machinetest/master/es/es-discovery-svc.yaml",
  "https://raw.githubusercontent.com/deepakcm34/machinetest/master/es/es-master.yaml",
  "https://raw.githubusercontent.com/deepakcm34/machinetest/master/es/es-ingest.yaml",
  "https://raw.githubusercontent.com/deepakcm34/machinetest/master/es/es-ingest-svc.yaml",
  "https://raw.githubusercontent.com/deepakcm34/machinetest/master/es/es-data.yaml",
  "https://raw.githubusercontent.com/deepakcm34/machinetest/master/kibana/pvc.yaml",
  "https://raw.githubusercontent.com/deepakcm34/machinetest/master/kibana/configmap.yaml",
  "https://raw.githubusercontent.com/deepakcm34/machinetest/master/kibana/fluentd.yaml",
  "https://raw.githubusercontent.com/deepakcm34/machinetest/master/kibana/kibana.yaml",
  "https://raw.githubusercontent.com/deepakcm34/machinetest/master/kibana/kibana-svcdeepak.yaml"
]

# List of CIDRs from which SSH access is allowed
ssh_access_cidr = [
    "0.0.0.0/0"
]

# List of  CIDRs from which API access is allowed
api_access_cidr = [
    "0.0.0.0/0"
]

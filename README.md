## Deploy EKS cluster with terraform using GitHub Actions

### Prerequisites
- Terraform v0.13.4
- Helm v3.3.0

Note: Make sure github action and your laptop version is same, else it will break your local or github action. State files are store in S3 which is locked with version to keep it consistent.
## Setup on laptop without github actions

1. Download Terraform 0.13.4 from https://www.terraform.io/downloads.html
2. Install helm 3 - https://helm.sh/ - Helm 2 and Tiller is not longer in use.


## Run the code after switching to master branch

### Terraform init
```
terraform init -backend-config=backend.tfvars
```

### Before commiting, else workflow not let you deploy
```
terraform validate
```

### Terraform Plan

```
terraform plan -var-file=master.tfvars
```

### Terraform Apply

You can let terraform apply happen at github actions, but in massive change it can become a mandatory to double check before you hit a disaster.

```
terraform apply -var-file=master.tfvars
```


## How to create more such environment
You can create branches, 1 branch equals to 1 environment. To make that happen you need to tweek 3 files.
1. .github/workflows/branch.yml - copy master.yml and tweak as needed.
2. backend.tfvars, this stores terraform state file key in S3. If not update change, it can destory master state and create a new infrastructure.
3. master.tfvars - tweak vpc, subnets, instance types, min, max number of servers from here and as per your needs.


## Important concepts
### Check autoscaler logs
```
kubectl -n kube-system logs -f deployment.apps/cluster-autoscaler-chart-aws-cluster-autoscaler-chart
```

### Cluster Autoscaler document
https://docs.aws.amazon.com/eks/latest/userguide/cluster-autoscaler.html

### Get kubectl config
```
aws eks --region us-east-1 update-kubeconfig --name staging01
```

### RBAC

*TODO*

## Learn
 - https://learn.hashicorp.com/terraform
 - https://docs.bitnami.com/tutorials/create-your-first-helm-chart/
 - https://aws.amazon.com/getting-started/hands-on/amazon-eks-with-spot-instances/
 - Google ;-)
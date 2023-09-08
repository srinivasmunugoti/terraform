prerequisite
1)aws tool path added in system environment path
2)terraform tool path added in system environment path
3)kubectl tool path added in system environment path
4)helm tool 
5) git bash
=======================================================================
# contents present in scripts
1)elastic cache
2)rds(mssql)
3)eks cluster with karpenter having two nodes 
  3.1)addons(coredns,kubeproxy,vpc cni, ebs driver)
  3.2)aws load balancer controller
  3.3)helm charts (metric server, nginx ingress, jenkins)

============================================
 
steps 
1)do aws configure 
2) update aws arn in main.tf file
 replace userarn with your arn
 aws_auth_users = [
    {
      userarn  = "arn:aws:iam::663043874531:user/srinivas@alike"
      username = "srinivas@alike"
      groups   = [""]

3) terraform init
4)terraform apply -target module.vpc
5) cd .\helmcharts\aws-load-balancer-controller\values.yaml
6) change vpc id
7)cd ../../
8) terraform apply 
9) wait for 30 min, once all completed , do local cluster details update using below command

aws eks update-kubeconfig --name karpenter --region us-east-1
10) check cluster connection using below command, if getting pods running so cluster is running good
kubectl get pods -A
11) probably use git bash of same present locations for deploy helm charts of metric server,nginx,jenkins, check once all running well , add manually 
 "AmazonEKS_EBS_CSI_DriverRole" to both the node groups so , jenkins also comes up and running automatically

sh helmdeployments

12) now everything is ready need to do some customisation as per our requirment







To provision this example:

```sh
terraform init
terraform apply -target module.vpc
terraform apply -target module.eks
terraform apply
```

Enter `yes` at command prompt to apply

## Destroy

To teardown and remove the resources created in this example:

```sh
kubectl delete deployment inflate
terraform destroy -target="module.eks_blueprints_addons" -auto-approve
terraform destroy -target="module.eks" -auto-approve
terraform destroy -auto-approve
```

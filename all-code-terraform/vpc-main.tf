module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name = "alike-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  elasticache_subnet_group_name = "elastic-sub-group"
  elasticache_subnets = ["10.0.7.0/24", "10.0.8.0/24"]
  
  public_subnet_names = ["pub1","pub2","pub3"]

  enable_nat_gateway = true
  enable_vpn_gateway = false
  single_nat_gateway = true
  one_nat_gateway_per_az = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
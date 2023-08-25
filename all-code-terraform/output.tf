output "vpc_id" {
  description = "The VPC ID"
  value       = module.vpc.vpc_id
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = "${module.security_group.security_group_id}"
}

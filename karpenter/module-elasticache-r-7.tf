module "redis" {
  source = "umotif-public/elasticache-redis/aws"
  version = "~> 3.0.0"

  name_prefix           = "core-example"
  num_cache_clusters    = 2
  node_type             = "cache.t4g.small"

  engine_version           = "7.0"
  port                     = 6379
  maintenance_window       = "mon:03:00-mon:04:00"
  snapshot_window          = "04:00-06:00"
  snapshot_retention_limit = 7

  automatic_failover_enabled = true

  at_rest_encryption_enabled = false
  transit_encryption_enabled = false
 # auth_token                 = "1234567890asdfghjkl"

  apply_immediately = true
  family            = "redis7"
  description       = "Test elasticache redis."

  subnet_ids = module.vpc.elasticache_subnets
  vpc_id     = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]

  parameter = [
    {
      name  = "repl-backlog-size"
      value = "16384"
    }
  ]

/*  log_delivery_configuration = [
    {
      destination_type = "cloudwatch-logs"
      destination      = "aws_cloudwatch_log_group.example.name"
      log_format       = "json"
      log_type         = "engine-log"
    }
  ]

*/
  tags = {
    Project = "Test"
  }
}

module "db" {
  source = "terraform-aws-modules/rds/aws"
  version = "6.1.1"
  

  identifier = "ms-sql-db"

  engine            = "sqlserver-ex"
  engine_version    = "15.00"
  instance_class    = "db.t3.large"
  allocated_storage = 20

  db_name  = " "
  username = "newuser"
  port     = "1433"

  iam_database_authentication_enabled = false

  vpc_security_group_ids = ["${module.security_group.security_group_id}"]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  monitoring_interval    = "30"
  monitoring_role_name   = "MyRDSMonitoringRole"
  create_monitoring_role = true

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = module.vpc.private_subnets

  # DB parameter group
  family = "sqlserver-ex-15.0"

  # DB option group
  major_engine_version = "15.00"

  # Database Deletion Protection
  deletion_protection = false

  create_db_parameter_group = false
  storage_encrypted = false
 
  
 
#depends_on = [module.vpc,module.security_group]

}
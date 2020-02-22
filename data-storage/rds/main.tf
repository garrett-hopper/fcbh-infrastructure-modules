provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}

  # The latest version of Terragrunt (v0.19.0 and above) requires Terraform 0.12.0 or above.
  required_version = ">= 0.12.0"
}

module "rds_cluster_aurora_mysql" {
  source              = "git::https://github.com/cloudposse/terraform-aws-rds-cluster.git?ref=tags/0.21.0"
  engine              = "aurora"
  cluster_family      = "aurora5.6"
  cluster_size        = "2"
  namespace           = var.namespace
  stage               = var.stage
  name                = var.name
  admin_user          = "sa"
  admin_password      = "Test123456789"  
  db_name             = var.db_name
  instance_type       = var.instance_type
  snapshot_identifier = var.snapshot_identifier
  vpc_id              = var.vpc_id
  security_groups     = var.security_groups
  subnets             = var.subnets
  zone_id             = var.zone_id

  # cluster_parameters = [
  #   {
  #     name  = "character_set_client"
  #     value = "utf8"
  #   },
  #   {
  #     name  = "character_set_connection"
  #     value = "utf8"
  #   },
  #   {
  #     name  = "character_set_database"
  #     value = "utf8"
  #   },
  #   {
  #     name  = "character_set_results"
  #     value = "utf8"
  #   },
  #   {
  #     name  = "character_set_server"
  #     value = "utf8"
  #   },
  #   {
  #     name  = "collation_connection"
  #     value = "utf8_bin"
  #   },
  #   {
  #     name  = "collation_server"
  #     value = "utf8_bin"
  #   },
  #   {
  #     name         = "lower_case_table_names"
  #     value        = "1"
  #     apply_method = "pending-reboot"
  #   },
  #   {
  #     name         = "skip-character-set-client-handshake"
  #     value        = "1"
  #     apply_method = "pending-reboot"
  #   }
  # ]
}

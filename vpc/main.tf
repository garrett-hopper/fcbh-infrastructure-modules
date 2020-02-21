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




data "aws_availability_zones" "available" {}

locals {
  max_availability_zones = 3
}

module "vpc" {
  source     = "git::https://github.com/cloudposse/terraform-aws-vpc.git?ref=tags/0.8.1"
  namespace  = var.namespace
  stage      = var.stage
  name       = var.name
  cidr_block = var.cidr_block
}

module "subnets" {
  source              = "git::https://github.com/cloudposse/terraform-aws-dynamic-subnets.git?ref=tags/0.19.0"
  availability_zones  = slice(data.aws_availability_zones.available.names, 0, local.max_availability_zones)
  namespace           = var.namespace
  stage               = var.stage
  name                = var.name
  vpc_id              = module.vpc.vpc_id
  igw_id              = module.vpc.igw_id
  cidr_block          = module.vpc.vpc_cidr_block
  nat_gateway_enabled = "true"
}



# locals {
#   public_cidr_block  = cidrsubnet(var.cidr_block, 1, 0)
#   private_cidr_block = cidrsubnet(var.cidr_block, 1, 1)
# }

# module "public_subnets" {
#   source            = "git::https://github.com/cloudposse/terraform-aws-named-subnets.git?ref=tags/0.4.0"
#   availability_zone = var.availability_zone
#   namespace          = var.namespace
#   stage              = var.stage
#   name               = var.name
#   subnet_names      = ["public1", "public2"]
#   vpc_id            = module.vpc.vpc_id
#   cidr_block        = local.public_cidr_block
#   type              = "public"
#   igw_id            = module.vpc.igw_id
# }

# module "private_subnets" {
#   source            = "git::https://github.com/cloudposse/terraform-aws-named-subnets.git?ref=tags/0.4.0"
#   availability_zone = var.availability_zone
#   namespace          = var.namespace
#   stage              = var.stage
#   name               = var.name
#   subnet_names      = ["private1", "private2"]
#   vpc_id            = module.vpc.vpc_id
#   cidr_block        = local.private_cidr_block
#   type              = "private"
#   ngw_id            = module.public_subnets.ngw_id
# }

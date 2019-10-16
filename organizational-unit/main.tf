
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

# 2. Create organization unit. 
resource "aws_organizations_organizational_unit" "org_unit" {
  name      = var.organization_unit_name
  parent_id = var.organization_id
}

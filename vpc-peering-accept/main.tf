# for reference, a good article:https://chandarachea.medium.com/vpc-peering-connetion-with-terraform-c4522a24bf3e

terraform {
  # Live modules pin exact Terraform version; generic modules let consumers pin the version.
  # The latest version of Terragrunt (v0.19.0 and above) requires Terraform 0.12.0 or above.
  required_version = "~> 0.12"

  # Live modules pin exact provider version; generic modules let consumers pin the version.
  required_providers {
    aws = {
      version = "~> 2.70"
    }
  }
}

data "aws_caller_identity" "current" {}

resource "aws_vpc_peering_connection_accepter" "accepter_connection" {
  vpc_peering_connection_id =   var.peering_connection_id 
  auto_accept               = true
  tags = {
    Side = "Accepter"
    Name = var.accepter_name_tag
  }
}

data "aws_route_table" "selected" {
  subnet_id = var.accepter_subnet_id
}

resource "aws_route" "accepter_route" {
  route_table_id            = data.aws_route_table.selected.route_table_id
  destination_cidr_block    = var.requester_cidr_block
  vpc_peering_connection_id = var.peering_connection_id
}
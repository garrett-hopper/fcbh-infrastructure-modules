# This module can be applied in multiple regions
variable "aws_region" {
  default = "us-east-2"
}

# specify a different AWS profile to provide different access keys
variable "aws_profile" {
  type    = string
  default = "bibleis-admin"
}

variable "security_group_name" {
  type    = string
  default = "Bastion Security Group"
}
variable "vpc_id" {

}
variable "control_cidr" {
  type = list(string)
}
variable "host_name" {
  default = "Bastion Host"
}
variable "ami_id" {

}
variable "key_name" {

}
variable "instance_type" {
  default = "t3.small"
}
variable "subnet_id" {

}

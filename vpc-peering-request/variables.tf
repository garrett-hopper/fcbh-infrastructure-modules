variable "requester_vpc_id" {}

variable "requester_cidr_block" {}

variable "requester_name_tag" {}
variable "requester_subnet_id" {}

variable "accepter_owner_id" {}

variable "accepter_region" {
    default = "us-west-2"
}
variable "accepter_vpc_id" {}

variable "accepter_cidr_block" {}


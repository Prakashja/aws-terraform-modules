variable "environment" {}
variable "region" {}
variable "cidr_block" {}
variable "instance_tenancy" {
  default = "default"
}
variable "private_subnets_a" {}
variable "private_subnets_b" {}
variable "spare_private_subnets" {}
variable "public_subnets" {}
variable "enable_nat_gateway" {
  default = false
}
variable "single_nat_gateway" {
  default = false
}
variable "default_vpc_enable_dns_hostnames" {
  default = false
}
variable "azs" {}
variable "private_subnet_assign_ipv6_address_on_creation" {
  default = null
}
variable "assign_ipv6_address_on_creation" {
  default = false
}

variable "enable_ipv6" {
  default = false
}

variable "private_subnet_ipv6_prefixes" {
  default = []
}
variable "private_subnet_suffix_a" {
  default = "private-subnet-a"
}
variable "private_subnet_suffix_b" {
  default = "private-subnet-b"
}
variable "private_subnet_suffix_c" {
  default = "private-subnet-c"
}
variable "public_subnet_suffix" {
  default = "publicsubnet"
}
variable "private_subnet_tags" {}
variable "public_subnet_tags" {}
variable "vpc_id" {}
variable "pub_route_table_id" {}
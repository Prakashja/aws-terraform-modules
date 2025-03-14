provider "aws" {
  region = var.region
}

terraform {}

module "vp" {
  source = "../../vpc"
  azs    = data.aws_availability_zones.available.names
  cidr_block = var.cidr_block
  environment = var.environment
  private_subnet_tags = {
    "kubernetes.io/cluster/${var.environment}-eks-cluster" = "shared"
    "kubernetes.io/role/elb" = "1"
  }
  private_subnets_a = var.private_subnets_a
  private_subnets_b = var.private_subnets_b
  pub_route_table_id = var.pub_route_table_id
  public_subnet_tags = {
    "kubernetes.io/cluster/${var.environment}-eks-cluster" = "shared"
    "kubernetes.io/role/elb" = "1"
  }
  public_subnets = var.public_subnets
  region = var.region
  spare_private_subnets =  var.spare_private_subnets
  vpc_id = var.vpc_id
  enable_nat_gateway= var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway
}
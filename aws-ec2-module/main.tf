module "ec2" {
  source            = "./aws-ec2"
  ec2_ami           = data.aws_ami.ami_id.id
  ec2_instances_typ = var.ec2_instance_type
  ec2_instance_name = var.ec2_instance_name
  common_tags       = local.common_tags
  ec2_key_name      = var.ec2_key_name
  user_data         = var.user_data
}

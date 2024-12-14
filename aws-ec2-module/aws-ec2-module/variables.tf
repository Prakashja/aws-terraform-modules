variable "ec2_ami" {
  type        = string
  description = "AMI iD of the EC2 Instance"
}

variable "ec2_instances_typ" {
  type        = string
  description = "EC2 instances type"
}

variable "ec2_instance_name" {
  type        = string
  description = "Name of the Ec2 instance"
}

variable "common_tags" {
  description = "list of Common tage specific to project, which will hellp to identify teh resource"
}

variable "ec2_key_name" {
  type        = string
  description = "EC2 key name which will be used for SSh.."
}
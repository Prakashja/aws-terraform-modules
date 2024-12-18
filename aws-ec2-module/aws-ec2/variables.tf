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

variable "root_volume_size" {
  type        = number
  description = "then root volume size"
  default     = 8
}

variable "root_volume_type" {
  type        = string
  default     = "gp2"
  description = "the root volume type"
}

variable "associate_public_ip_address" {
  type        = bool
  default     = true
  description = "associate the public Ip or not ex: true/false"
}

variable "user_data" {
  description = "User data script to be passed to EC2 instance"
  type        = string
}
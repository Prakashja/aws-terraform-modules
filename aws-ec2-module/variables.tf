# variable "ec2_ami" {
#   type        = string
#   description = "AMI ID of EC2 Instances"
# }
variable "ec2_instance_type" {
  type        = string
  description = "EC2 instance type ex: t2.medium"
}

variable "ec2_instance_name" {
  type        = string
  description = "Name of the Ec2 Instance"
}

variable "ec2_os_name" {
  description = "Name of the OS"
}

variable "app_name" {
  type        = string
  description = "name of the app"
}

variable "team_name" {
  type        = string
  description = "team name"
}

variable "environment" {
  type        = string
  description = "name of the environment"
}

variable "owner" {
  type        = string
  description = "owner or contact of the resource"
}

variable "contact_dl" {
  type        = string
  description = "conant email id"
}

variable "ec2_key_name" {
  type        = string
  description = "EC2 key name which will be used for SSh.."
}

variable "user_data" {
  description = "User data script to be passed to EC2 instance"
  type        = string
}
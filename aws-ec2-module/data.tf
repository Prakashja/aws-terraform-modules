data "aws_ami" "ami_id" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = [var.ec2_os_name]
  }
}

output "wndowas_ami" {
  value = data.aws_ami.ami_id.id
}


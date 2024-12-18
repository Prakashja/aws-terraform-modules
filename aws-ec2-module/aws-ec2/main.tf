resource "aws_instance" "m_instance" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instances_typ
  key_name                    = var.ec2_key_name
  user_data                   = var.user_data
  associate_public_ip_address = var.associate_public_ip_address
  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
  }
  tags = merge(
    {
      Name = "${var.ec2_instance_name}-${var.common_tags.environment}"
    },
    var.common_tags
  )
}

output "ec2_instance_id" {
  value = aws_instance.m_instance.id
}




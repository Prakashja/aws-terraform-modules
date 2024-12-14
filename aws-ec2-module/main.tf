resource "aws_instance" "m_instance" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instances_typ
  key_name      = var.ec2_key_name
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
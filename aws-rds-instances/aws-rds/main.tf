resource "aws_kms_key" "rds_kms" {
  is_enabled              = true
  deletion_window_in_days = 0
  enable_key_rotation     = true
}

resource "aws_db_subnet_group" "my_sub" {
  subnet_ids = var.subnet_ids
}

resource "aws_db_parameter_group" "parameter_group" {
  family = var.parameter_group_family
}

resource "random_password" "db_password" {
  length  = 12
  special = false
}

resource "aws_security_group" "rds_sg" {
  name        = "${var.identifier}-rds-sg"
  vpc_id      = var.vpc_id
  description = "this sg will restrict the access to RDS ${var.identifier}"
}

resource "aws_cloudwatch_log_group" "postgresql" {
  name              = "/aws/rds/${var.identifier}/postgresql"
  retention_in_days = 1
  tags              = var.common_tags
}

resource "aws_cloudwatch_log_group" "upgrade" {
  name              = "/aws/rds/${var.identifier}/upgrade"
  retention_in_days = 1
  tags              = var.common_tags
}

resource "aws_security_group_rule" "sg_ingress_1" {
  from_port         = 5432
  protocol          = "tcp"
  security_group_id = aws_security_group.rds_sg.id
  to_port           = 5432
  type              = "ingress"
  cidr_blocks       = var.cidrs
}

resource "aws_security_group_rule" "egress" {
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.rds_sg.id
  to_port           = 443
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_db_instance" "my_db_instance" {
  allocated_storage               = var.allocated_storage
  allow_major_version_upgrade     = var.allow_major_version_upgrade
  apply_immediately               = var.apply_immediately
  auto_minor_version_upgrade      = var.auto_minor_version_upgrade
  availability_zone               = var.availability_zone
  backup_retention_period         = var.backup_retention_period
  backup_window                   = var.backup_window
  copy_tags_to_snapshot           = var.copy_tags_to_snapshot
  db_name                         = var.db_name
  db_subnet_group_name            = aws_db_subnet_group.my_sub.name
  deletion_protection             = var.deletion_protection
  engine                          = var.rds_engine_name
  engine_version                  = var.rds_engine_version
  final_snapshot_identifier       = ""
  identifier                      = var.identifier
  instance_class                  = var.instance_class
  iops                            = var.iops
  kms_key_id                      = aws_kms_key.rds_kms.arn
  maintenance_window              = var.maintenance_window
  max_allocated_storage           = var.max_allocated_storage
  multi_az                        = var.multi_az
  parameter_group_name            = aws_db_parameter_group.parameter_group.name
  password                        = random_password.db_password.result
  port                            = var.rds_port
  snapshot_identifier             = var.snapshot_identifier
  storage_encrypted               = var.storage_encrypted
  storage_type                    = var.storage_type
  tags                            = var.common_tags
  username                        = var.username
  vpc_security_group_ids          = [aws_security_group.rds_sg.id]
  enabled_cloudwatch_logs_exports = ["postgresql ", "upgrade"]
  depends_on                      = [aws_cloudwatch_log_group.postgresql, aws_cloudwatch_log_group.upgrade]
}
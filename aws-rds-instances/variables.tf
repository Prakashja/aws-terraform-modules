variable "vpc_id" {
  type        = string
  description = "vpc id"
}
variable "subnet_ids" {
  type        = any
  description = "list of subnet ids, ex: [subnet1,subnet2,subnet3]"
}
variable "parameter_group_family" {
  type        = string
  description = "name of the parameter group family, ex: postgres13"
}
variable "identifier" {
  type        = string
  description = "name of the RDS instances"
  validation {
    condition     = len(var.identifier) < 64
    error_message = "the length of rds instance name is more than 64 characters"
  }
}
variable "cidrs" {}
variable "allocated_storage" {}
variable "allow_major_version_upgrade" {}
variable "apply_immediately" {}
variable "auto_minor_version_upgrade" {}
variable "availability_zone" {}
variable "backup_retention_period" {}
variable "backup_window" {}
variable "copy_tags_to_snapshot" {}
variable "db_name" {}
variable "deletion_protection" {}
variable "rds_engine_name" {}
variable "rds_engine_version" {}
variable "instance_class" {}
variable "iops" {}
variable "maintenance_window" {}
variable "max_allocated_storage" {}
variable "multi_az" {}
variable "rds_port" {}
variable "snapshot_identifier" {}
variable "storage_encrypted" {}
variable "storage_type" {}
variable "username" {}
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

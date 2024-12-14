locals {
  common_tags = merge({
    app         = var.app_name,
    team        = var.team_name,
    environment = var.environment,
    owner       = var.owner
    contact_dl  = var.contact_dl
  })
}
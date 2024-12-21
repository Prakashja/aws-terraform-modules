<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2"></a> [ec2](#module\_ec2) | ./aws-ec2 | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_ami.ami_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | name of the app | `string` | n/a | yes |
| <a name="input_contact_dl"></a> [contact\_dl](#input\_contact\_dl) | conant email id | `string` | n/a | yes |
| <a name="input_ec2_instance_name"></a> [ec2\_instance\_name](#input\_ec2\_instance\_name) | Name of the Ec2 Instance | `string` | n/a | yes |
| <a name="input_ec2_instance_type"></a> [ec2\_instance\_type](#input\_ec2\_instance\_type) | EC2 instance type ex: t2.medium | `string` | n/a | yes |
| <a name="input_ec2_key_name"></a> [ec2\_key\_name](#input\_ec2\_key\_name) | EC2 key name which will be used for SSh.. | `string` | n/a | yes |
| <a name="input_ec2_os_name"></a> [ec2\_os\_name](#input\_ec2\_os\_name) | Name of the OS | `any` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | name of the environment | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | owner or contact of the resource | `string` | n/a | yes |
| <a name="input_team_name"></a> [team\_name](#input\_team\_name) | team name | `string` | n/a | yes |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | User data script to be passed to EC2 instance | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_instance_id"></a> [ec2\_instance\_id](#output\_ec2\_instance\_id) | n/a |
| <a name="output_wndowas_ami"></a> [wndowas\_ami](#output\_wndowas\_ami) | n/a |
<!-- END_TF_DOCS -->
resource "random_password" "my_password" {
  length  = 7
  special = true
}

resource "random_pet" "my_username" {
  length = 2
}

output "user_name" {
  value = random_pet.my_username.id
}

output "my_password" {
  value = random_password.my_password.result
  sensitive = true
}

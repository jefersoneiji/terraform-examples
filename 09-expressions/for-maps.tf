locals {
  doubles_map = { for key, value in var.numbers_map : key => value * 2 }
  evens_map   = { for key, value in var.numbers_map : key => value * 2 if value % 2 == 0 }
}

output "doubles_map" {
  value = local.doubles_map
}

output "evens_map" {
  value = local.evens_map
}
locals {
  math       = 2 * 2
  equality   = 2 != 2
  comparison = 2 < 1
  logical    = true || false
}

output "operators" {
  value = {
    math       = local.math
    equality   = local.equality
    comparison = local.comparison
    logical    = local.logical
  }
}
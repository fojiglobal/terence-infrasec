# resource "aws_vpc" "main" {
#   count                = var.vpc_count
#   cidr_block           = var.cidr_block
#   enable_dns_hostnames = var.enable_dns
# }

resource "aws_iam_user" "name" {
  count = length(var.infrasec_users)
  name  = var.infrasec_users[count.index]
}

output "jdoe" {
  value = aws_iam_user.name[0]
}

resource "aws_iam_user" "managers" {
  for_each = toset(var.managers_users)
  name     = each.value
}
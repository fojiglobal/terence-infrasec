resource "aws_organizations_organization" "org" {
  aws_service_access_principals = [
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
  ]

  feature_set = "ALL"
}

## Creation of org accounts using terraform
resource "aws_organizations_account" "cs2_secops" {
  name  = "CS2-secops"
  email = "cs2.secops1@gmail.com"
  parent_id = aws_organizations_organizational_unit.cs2_secops.id
}

## Creation of org accounts using terraform
resource "aws_organizations_account" "cs2_sandbox" {
  name  = "CS2-Sandbox"
  email = "cs2.sandbox1@gmail.com"
  parent_id = aws_organizations_organizational_unit.cs2_sandbox.id
}

## These two conditions below will create two additional AWS org namely secops and Sandbox
resource "aws_organizations_organizational_unit" "cs2_secops" {
  name      = "secops"
  parent_id = aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_organizational_unit" "cs2_sandbox" {
  name      = "Sandbox"
  parent_id = aws_organizations_organization.org.roots[0].id
}
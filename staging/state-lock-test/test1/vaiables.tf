variable "cidr_block" {
  type    = string
  default = "10.50.0.0/16"
}

variable "vpc_count" {
  type    = number
  default = "2"
}

variable "enable_dns" {
  type    = bool
  default = false
}

variable "infrasec_users" {
  type    = list(string)
  default = ["jdoe", "jdone", "jbrown"]
}

variable "managers_users" {
  type    = list(string)
  default = ["bobama", "jbiden", "kharis"]
}

variable "vpcs" {
  type = map(object({
    cidr       = string
    tags       = map(string)
    tenancy    = string
    enable_dns = bool
  }))
  default = {
    "staging" = {
      cidr       = "10.50.0.0/16"
      tenancy    = "default"
      enable_dns = false
      tags = {
        Name        = "staging-vpc"
        Environment = "staging"
      }
    }
    "qa" = {
      cidr       = "10.60.0.0/16"
      tenancy    = "default"
      enable_dns = false
      tags = {
        Name        = "qa-vpc"
        Environment = "qa"
      }
    }
    "prod" = {
      cidr       = "10.70.0.0/16"
      tenancy    = "default"
      enable_dns = false
      tags = {
        Name        = "prod-vpc"
        Environment = "prod"
      }
    }
  }
}
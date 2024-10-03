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

variable "test_vpc" {
  type    = list(string)
  default = ["10.80.0.0/16", "10.90.0.0/16"]
}

##### Creating public subnets for the staging, qa ansd prod vpcs ####
variable "public_subnets" {
  type = map(object({
    cidr       = string
    tags       = map(string)
    azs = string
    enable_public_ip = bool
  }))
  
  default = {
    "pub-sub1" = {
     cidr = "10.110.1.0/24"
     azs = "ue-east-2a" 
     enable_public_ip = true
     tags ={
      Name = "pub-sub-1"
      Environment = "staging"
     }
    }
    "pub-sub2" = {
     cidr = "10.110.2.0/24"
     azs = "ue-east-2b" 
     enable_public_ip = true
     tags ={
      Name = "pub-sub-2"
      Environment = "staging"
     }
    }
    "pub-sub3" = {
     cidr = "10.110.3.0/24"
     azs = "ue-east-2c" 
     enable_public_ip = true
     tags ={
      Name = "pub-sub-3"
      Environment = "staging"
     }
    }
  }
}
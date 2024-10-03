##### vpc module variables####
variable "enable_dns" {
  type    = bool
  default = false
}

variable "public_subnets" {
  type = map(object({
    cidr       = string
    azs = string
    enable_public_ip = bool
    tags       = map(string)
  }))
}

variable "private_subnets" {
  type = map(object({
    cidr       = string
    tags       = map(string)
    azs = string
  }))
}

variable "env" {
  type = string
  
}

variable "vpc_cidr" {
  type = string
  
}
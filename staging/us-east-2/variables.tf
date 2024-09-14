variable "staging_vpc_cidr" {
  type = string
  default = "10.10.0.0/16"
}

variable "qa_vpc_cidr" {
  type = string
  default = "10.15.0.0/16"
}
variable "us-east-2a" {
  type = string
  default = "us-east-2a"
  
}

variable "us-east-2b" {
  type = string
  default = "us-east-2b"
  
}
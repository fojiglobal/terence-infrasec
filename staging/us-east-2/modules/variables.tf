variable "vpc_cidr" {
  type = string
}

variable "env" {
  type = string
}
 #### Pub Subnet variables for 'this' vpc #####
 variable "public_subnets" {
  type = map(object({
    cidr = string
    azs = string
    tags = map(string)
  }))
 }
 variable "map_pub_ip" {
  type = bool
  default = true
   
 }

 #### Priv Subnet variables for 'this' vpc #####
 variable "private_subnets" {
  type = map(object({
    cidr = string
    azs = string
    tags = map(string)
  }))
 }

###### Nat Gateway variable for subnet id #########
variable "pub-sub-name" {
  type = string
}

###### Route Table ############
variable "all_ipv4_cidr" {
  type = string
  default = "0.0.0.0/0"
}

 ###### Auto Scaling Variable ######
 variable "ami_id" {
  type = string
   default = "ami-085f9c64a9b75eed5"
 }
 variable "instance_type" {
   type = string
   default = "t2.micro"
 }

 variable "instance_key" {
   type = string
   default = "cs2-use2-main"
 }

 variable "user_data" {
  type = string 
 }

 #### Auto Scaling Group Association ####
 variable "min_size" {
   type = number
   default = 1
 }

 variable "max_size" {
   type = number
   default = 2
 }

 variable "desired" {
   type = number
   default = 2
 }

 ### Security Group Variable for Public SG #####
 variable "public_sg_ingress" {
  type = map(object({
    src = string
    from_port   = number
    to_port     = number
    ip_protocol = string
    description = string
  }))
 }

 variable "public_sg_egress" {
    type = map(object({
    dest = string
    ip_protocol = string
    description = string
  }))
 }

  ### Security Group Variable for Private SG #####
 variable "private_sg_ingress" {
  type = map(object({
    src = string
    from_port   = number
    to_port     = number
    ip_protocol = string
    description = string
  }))
 }

 variable "private_sg_egress" {
  type = map(object({
    dest = string
    ip_protocol = string
    description = string
  }))
 }

 ##### Bastion SG Variables ########
 variable "bastion_sg_ingress" {
   type = map(object({
    src = string
    from_port = number
    to_port = number
    ip_protocol = string
    description = string
  }))
}

variable "bastion_sg_egress" {
   type = map(object({
    dest = string
    ip_protocol = string
    description = string
  }))
}
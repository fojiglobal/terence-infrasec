###### Locals for VPC #######
locals {
  vpc_cidr = "10.50.0.0/16"
  env      = "staging"
}

### Public Subnets Locals #######
locals {
  public_subnets = {
    "pub-sub-1" = {
      cidr = cidrsubnet(local.vpc_cidr, 8, 1)
      azs  = "us-east-2a"
      tags = {
        Name        = "pub-sub-1"
        Environment = local.env
      }
    }
    "pub-sub-2" = {
      cidr = cidrsubnet(local.vpc_cidr, 8, 2)
      azs  = "us-east-2b"
      tags = {
        Name        = "pub-sub-2"
        Environment = local.env
      }
    }
    "pub-sub-3" = {
      cidr = cidrsubnet(local.vpc_cidr, 8, 3)
      azs  = "us-east-2c"
      tags = {
        Name        = "pub-sub-3"
        Environment = local.env
      }
    }
  }
}

########  Private Subnet Locasls ##########
locals {
  private_subnets = {
    "priv-sub-1" = {
      cidr = cidrsubnet(local.vpc_cidr, 8, 10)
      azs  = "us-east-2a"
      tags = {
        Name        = "priv-sub-1"
        Environment = local.env
      }
    }
    "priv-sub-2" = {
      cidr = cidrsubnet(local.vpc_cidr, 8, 11)
      azs  = "us-east-2b"
      tags = {
        Name        = "priv-sub-2"
        Environment = local.env
      }
    }
    "priv-sub-3" = {
      cidr = cidrsubnet(local.vpc_cidr, 8, 12)
      azs  = "us-east-2c"
      tags = {
        Name        = "priv-sub-3"
        Environment = local.env
      }
    }
  }
}

####### Locals Public SG #######

locals {
  public-sg-ingress = {
    "all-http" = {
      src         = "0.0.0.0/0"
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
      description = "Allow HTTP from Anywhere"
    }
    "all-https" = {
      src         = "0.0.0.0/0"
      from_port   = 443
      to_port     = 443
      ip_protocol = "tcp"
      description = "Allow HTTP from Anywhere"
    }
  }
  public-sg-egress = {
    "all-http" = {
      dest        = "0.0.0.0/0"
      ip_protocol = "-1"
      description = "Allow All To Anywhere"
    }
  }
}
####### Locals Private SG #######
locals {
  private-sg-egress = {
    "all" = {
      dest        = "0.0.0.0/0"
      ip_protocol = "-1"
      description = "Allow All To Anywhere"
    }
  }
  private-sg-ingress = {
    "all-http" = {
      src         = module.staging.public_sg_id
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
      description = "Allow HTTP from Anywhere"
    }
    "all-https" = {
      src         = module.staging.public_sg_id
      from_port   = 443
      to_port     = 443
      ip_protocol = "tcp"
      description = "Allow HTTP from Anywhere"
    }
    "bastion-ssh" = {
      src         = module.staging.bastion_sg_id
      from_port   = 22
      to_port     = 22
      ip_protocol = "tcp"
      description = "Allow SSH from Bastion"
    }
  }
}

######## Bastion SG Rules ###########
locals {
  bastion-sg-egress = {
    "all" = {
      dest        = "0.0.0.0/0"
      ip_protocol = "-1"
      description = "Allow All To Anywhere"
    }
  }
  bastion-sg-ingress = {
    "all-ssh" = {
      src         = "0.0.0.0/0"
      from_port   = 22
      to_port     = 22
      ip_protocol = "tcp"
      description = "Allow All To Anywhere"
    }
  }
}

data "aws_acm_certificate" "alb_cert" {
  domain      = "www.exam1.terence24labs.com"
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}

####### Load Balancer Locals #########
locals {
  http_port             = "80"
  http_protocol         = "HTTP"
  https_port            = "443"
  https_protocol        = "HTTPS"
  ssl_policy            = "ELBSecurityPolicy-2016-08"
  route53_target_health = false
  dns_record_type       = "A"
  certificate_arn       = data.aws_acm_certificate.alb_cert.arn
  alb_rule_condition    = ["stage.terence24labs.com", "www.stage.terence24labs.com"]
}
locals {
  dns_name = "terence24labs.com"
}
locals {
  dns_zone = "Z0008572TUUBOKQDBF7Z"
}

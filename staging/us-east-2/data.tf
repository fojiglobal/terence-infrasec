data "aws_route53_zone" "terence24labs" {
  name = "terence24labs.com."
}

### Web Base Ami ####################
data "aws_ami" "test-web" {
  most_recent      = true
  owners           = ["self"]

  filter {
    name   = "name"
    values = ["test-web-*"]
  }
}

######## Certifcate ##################
data "aws_acm_certificate" "alb_cert" {
  domain      = "www.exam1.terence24labs.com"
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}

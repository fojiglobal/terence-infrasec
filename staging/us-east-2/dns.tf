# resource "aws_route53_record" "exam1" {
#   zone_id = data.aws_route53_zone.terence24labs.zone_id
#   name    = "www.${data.aws_route53_zone.terence24labs.name}"
#   type    = "A"
#   ttl     = "300"
#   records = ["10.0.0.1"]
# }

###### Route 52 DNS Record #######################
resource "aws_route53_record" "exam1" {
  zone_id = data.aws_route53_zone.terence24labs.zone_id
  name    = "exam1.terence24labs.com"
  type    = "A"

  alias {
    name                   = aws_lb.staging_alb.dns_name
    zone_id                = aws_lb.staging_alb.zone_id
    evaluate_target_health = true
  }
}
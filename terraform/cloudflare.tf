data "cloudflare_zone" "zags_dev" {
  filter = {
    name = "zags.dev"
  }
}

resource "cloudflare_dns_record" "www_zags_dev" {
  zone_id = data.cloudflare_zone.zags_dev.zone_id
  comment = "Redirect www to root domain"
  content = "zags.dev"
  name    = "www"
  proxied = true
  ttl     = 1 # 1 is automatic TTL
  type    = "CNAME"
}

data "cloudflare_zone" "zags_dev" {
  filter = {
    name = "zags.dev"
  }
}

resource "cloudflare_dns_record" "www_zags_dev" {
  zone_id = data.cloudflare_zone.zags_dev.zone_id
  comment = "TF: Redirect www to root domain"
  content = "zags.pages.dev" # NOTE: 2025-03-28 - CNAME chaining to zags.dev wasn't working
  name    = "www.zags.dev"   # NOTE: 2025-03-28 - non-FQDN was triggering a resource update
  proxied = true
  ttl     = 1 # 1 is automatic TTL
  type    = "CNAME"
}

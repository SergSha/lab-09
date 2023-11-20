consul {
  address = "localhost:8500"

  retry {
    enabled = true
    attempts = 12
    backoff = "250ms"
  }
}

template {
  source = "/etc/consul-template.d/templates/upstream-wordpress.conf.ctmpl"
  destination = "/etc/consul-template.d/rendered/upstream-wordpress.conf"
  command = "nginx -s reload"
}

template {
  source = "/etc/consul-template.d/templates/update_dns.sh.ctmpl"
  destination = "/etc/consul-template.d/rendered/update_dns.sh"
  command = "/bin/bash /etc/consul-template.d/rendered/update_dns.sh > /dev/null"
}

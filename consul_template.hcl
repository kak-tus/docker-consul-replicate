max_stale = "2m"

deduplicate {
  enabled = true
  prefix = "service/docker-consul-replicate/dedup/"
}

template {
  source = "/etc/consul_replicate.hcl.template"
  destination = "/etc/consul_replicate.hcl"
}

exec {
  command = "consul-replicate -config /etc/consul_replicate.hcl"
  splay = "60s"
}

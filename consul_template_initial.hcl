consul = "consul.service.consul:8500"

template {
  source = "/etc/consul_replicate_initial.hcl.template"
  destination = "/etc/consul_replicate_initial.hcl"
}

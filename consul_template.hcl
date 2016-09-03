consul = "consul.service.consul:8500"

template {
  source = "/etc/consul_replicate.hcl.template"
  destination = "/etc/consul_replicate.hcl"
  command = "timeout -t 10 consul-replicate -config /etc/consul_replicate.hcl ; echo 1"
}

#exec {
#  command = "consul-replicate -config /etc/consul_replicate.hcl"
#  splay = "5s"
#  reload_signal = "SIGUSR1"
#}

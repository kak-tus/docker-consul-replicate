#!/bin/sh

consul-template -once -config=/etc/consul_template_initial.hcl
timeout -t 10 consul-replicate -once -config /etc/consul_replicate_initial.hcl
consul-template -config=/etc/consul_template.hcl

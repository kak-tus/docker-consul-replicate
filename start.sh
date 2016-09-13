#!/bin/sh

consul-template -once -config=/etc/consul_template_initial.hcl
consul-replicate -config /etc/consul_replicate_initial.hcl

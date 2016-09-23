#!/bin/sh

consul-template -once -template="/etc/consul_replicate_initial.hcl.template:/etc/consul_replicate_initial.hcl"
timeout -t 10 consul-replicate -config /etc/consul_replicate_initial.hcl

consul-template -config="/etc/consul_template.hcl"

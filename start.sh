#!/usr/bin/env sh

consul-template -once -template="/etc/consul_replicate_initial.hcl.template:/etc/consul_replicate_initial.hcl"
timeout -t 10 consul-replicate -config /etc/consul_replicate_initial.hcl

consul-template -config="/etc/consul_template.hcl" >/proc/1/fd/1 2>/proc/1/fd/2 &
child=$!

trap "kill $child" SIGTERM
wait "$child"

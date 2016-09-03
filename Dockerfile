FROM alpine:3.4

MAINTAINER Andrey Kuzmin "kak-tus@mail.ru"

ENV MASTER_DC=
ENV CONSUL_TOKEN=

COPY consul-replicate_0.2.0_SHA256SUMS.txt /bin/consul-replicate_0.2.0_SHA256SUMS.txt
COPY consul-template_0.15.0_SHA256SUMS /bin/consul-template_0.15.0_SHA256SUMS

COPY consul_template_initial.hcl /etc/consul_template_initial.hcl
COPY consul_replicate_initial.hcl.template /etc/consul_replicate_initial.hcl.template
COPY consul_template.hcl /etc/consul_template.hcl
COPY consul_replicate.hcl.template /etc/consul_replicate.hcl.template

COPY start.sh /bin/start.sh

RUN apk add --no-cache curl \
  && cd /bin \

  && curl -L https://releases.hashicorp.com/consul-replicate/0.2.0/consul-replicate_0.2.0_linux_amd64.zip -o consul-replicate_0.2.0_linux_amd64.zip \
  && sha256sum -c consul-replicate_0.2.0_SHA256SUMS.txt \
  && unzip consul-replicate_0.2.0_linux_amd64.zip \
  && rm consul-replicate_0.2.0_linux_amd64.zip consul-replicate_0.2.0_SHA256SUMS.txt \

  && curl -L https://releases.hashicorp.com/consul-template/0.15.0/consul-template_0.15.0_linux_amd64.zip -o consul-template_0.15.0_linux_amd64.zip \
  && sha256sum -c consul-template_0.15.0_SHA256SUMS \
  && unzip consul-template_0.15.0_linux_amd64.zip \
  && rm consul-template_0.15.0_linux_amd64.zip consul-template_0.15.0_SHA256SUMS \

  && chmod +x start.sh

CMD ["start.sh"]

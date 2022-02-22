FROM ubuntu:focal

RUN apt-get update && apt-get -uy upgrade
RUN apt-get -y install ca-certificates && update-ca-certificates

FROM scratch

COPY --from=0 /etc/ssl/certs /etc/ssl/certs
ADD coredns /coredns
ADD Corefile /Corefile

EXPOSE 1053 1053/udp 1053/tcp
ENTRYPOINT ["/coredns"]

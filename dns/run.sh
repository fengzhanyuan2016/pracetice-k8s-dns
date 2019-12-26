docker run \
    --name dnsmasq \
    -d \
    -p 53:53/udp \
    -p 5380:8080 \
    -v /Users/iven/vms/k8s/dns/dnsmasq.conf:/etc/dnsmasq.conf \
    -v /Users/iven/vms/k8s/dns/dnsmasq.resolv.conf:/etc/dnsmasq.resolv.conf \
    -v /Users/iven/vms/k8s/dns/dnsmasq.hosts:/etc/dnsmasq.hosts \
    --log-opt "max-size=100m" \
    -e "HTTP_USER=foo" \
    -e "HTTP_PASS=bar" \
    --restart always \
    jpillora/dnsmasq
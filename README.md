# Desciptions
- micro servive with Docker orchestration ecosystem
- simple & easy to manage

# Dependencies
- [docker-zk-exhibitor](https://github.com/supernova106/docker-zk-exhibitor.git) 
- [marathon](https://github.com/mesosphere/marathon) mesosphere/marathon:v1.4.2-snapshot3
- mesosphere/mesos-slave:1.2.0-rc2
- mesosphere/mesos-master:1.2.0-rc2
- supervisor:3.3.1
- zookeeper:3.4.9
- traefik:1.1.2
- consul:0.7.5
- consul-cli:0.3.1
- dnsmasq: Make sure dnsmasq forward DNS query to Consul DNS interface

# Optionals
- https://www.digitalocean.com/community/tutorials/how-to-set-up-an-openvpn-server-on-ubuntu-16-04 
- OpenVPN: Including server sides machines, or routing client side traffic to OpenVPN by pushing DNS server to the client.

```
push "route 10.2.0.0 255.255.0.0"
push "dhcp-option DNS 10.2.2.215"
```

# Supported Platform
- AWS
- Ubuntu 16.04

# Contact

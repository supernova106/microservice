#!/bin/bash
/usr/sbin/openvpn --daemon --writepid /var/run/openvpn/server.pid --cd /etc/openvpn --config server.conf --script-security 2
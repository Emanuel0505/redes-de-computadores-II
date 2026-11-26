#!/bin/sh
ip addr flush dev eth0
dhclient -1 -v eth0 || echo "DHCP falhou"

exec "$@"
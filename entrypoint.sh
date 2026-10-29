#!/bin/sh
IF=$(ip -o -4 addr show | awk '/172\.20\.0\./{print $2; exit}')
udhcpc -i "$IF" -n -q -s /dhcp/udhcpc.script -x "hostname:$(hostname)" || exit 1
exec "$@"
#!/bin/sh

action=$1
ip=$3
host=$4
allowlist=/etc/dnsmasq.d/mdns-allowlist
hosts=/etc/dnsmasq.d/mdns-hosts

[ -n "$ip" ] || exit 0

while ! mkdir /tmp/mdns-hosts.lock 2>/dev/null; do
    sleep 1
done
trap 'rmdir /tmp/mdns-hosts.lock' 0
trap 'exit 1' HUP INT TERM

current=$(cat "$hosts" 2>/dev/null)

case "$action" in
    add|old)
        if [ -n "$host" ] && grep -Fxq "$host" "$allowlist"; then
            updated=$(printf '%s\n' "$current" | awk -v ip="$ip" -v name="$host.local" '
                NF == 0 { next }
                $1 == ip || $2 == name {
                    if (!done) { print ip, name; done = 1 }
                    next
                }
                { print }
                END { if (!done) print ip, name }')
        else
            updated=$(printf '%s\n' "$current" | awk -v ip="$ip" 'NF && $1 != ip')
        fi
        ;;
    del)
        updated=$(printf '%s\n' "$current" | awk -v ip="$ip" 'NF && $1 != ip')
        ;;
    *)
        exit 0
        ;;
esac

if [ "$updated" != "$current" ]; then
    printf '%s\n' "$updated" > "$hosts"
fi
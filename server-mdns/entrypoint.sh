#!/bin/sh
set -eu

hosts=/etc/avahi/hosts
avahi_pid=

start_avahi() {
    avahi-daemon --no-chroot --no-drop-root --no-rlimits &
    avahi_pid=$!
    sleep 1
    if ! kill -0 "$avahi_pid" 2>/dev/null; then
        wait "$avahi_pid"
        return 1
    fi
}

stop_avahi() {
    if [ -n "$avahi_pid" ] && kill -0 "$avahi_pid" 2>/dev/null; then
        kill -TERM "$avahi_pid"
        wait "$avahi_pid" || true
    fi
}

trap 'exit 0' INT TERM
trap 'stop_avahi' EXIT

start_avahi
last=$(cksum "$hosts")

while :; do
    sleep 1
    if ! kill -0 "$avahi_pid" 2>/dev/null; then
        wait "$avahi_pid"
        exit 1
    fi
    current=$(cksum "$hosts")
    if [ "$current" != "$last" ]; then
        stop_avahi
        start_avahi
        last=$current
    fi
done

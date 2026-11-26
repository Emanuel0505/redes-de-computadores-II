FROM alpine:latest
RUN apk add --no-cache avahi avahi-tools \
    && rm -f /etc/avahi/services/ssh.service /etc/avahi/services/sftp-ssh.service
COPY avahi-daemon.conf /etc/avahi/avahi-daemon.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
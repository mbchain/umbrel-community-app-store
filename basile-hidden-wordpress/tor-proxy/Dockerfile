FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y tor gettext-base && \
    rm -rf /var/lib/apt/lists/*

COPY torrc.template /etc/tor/torrc.template
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Precreate Tor hidden service directory
RUN mkdir -p /var/lib/tor/hidden_service && \
    chown -R debian-tor:debian-tor /var/lib/tor/hidden_service && \
    chmod 700 /var/lib/tor/hidden_service

VOLUME ["/var/lib/tor/hidden_service"]

ENTRYPOINT ["/entrypoint.sh"]

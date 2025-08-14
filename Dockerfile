FROM kasmweb/chromium:1.17.0

# Copy proxy policy JSON to Chromium's managed policies folder
COPY proxy.json /etc/opt/chrome/policies/managed/proxy.json

# Create folder for KasmVNC config and copy our non-SSL config
RUN mkdir -p /etc/kasmvnc
COPY kasmvnc.yaml /etc/kasmvnc/kasmvnc.yaml

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends openssl \
    && mkdir -p /etc/ssl/private /etc/ssl/certs \
    && openssl req -x509 -nodes -days 3650 -newkey rsa:2048 \
        -keyout /etc/ssl/private/ssl-cert-snakeoil.key \
        -out /etc/ssl/certs/ssl-cert-snakeoil.pem \
        -subj "/CN=localhost" \
    && chmod 600 /etc/ssl/private/ssl-cert-snakeoil.key \
    && rm -rf /var/lib/apt/lists/*


# Switch back to original user if needed, e.g. kasm-user
USER kasm-user
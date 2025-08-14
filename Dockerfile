FROM kasmweb/chromium:1.17.0

# Copy proxy policy JSON to Chromium's managed policies folder
COPY proxy.json /etc/opt/chrome/policies/managed/proxy.json

# Install OpenSSL for selfsigned certificates
USER root

RUN apt-get update && apt-get install -y --no-install-recommends openssl \
    && rm -rf /var/lib/apt/lists/*

USER kasm-user
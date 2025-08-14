FROM kasmweb/chromium:1.17.0

# Copy proxy policy JSON to Chromium's managed policies folder
COPY proxy.json /etc/opt/chrome/policies/managed/proxy.json

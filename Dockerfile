FROM kasmweb/chromium:latest

# Copy proxy policy JSON to Chromium's managed policies folder
COPY proxy.json /etc/opt/chrome/policies/managed/proxy.json

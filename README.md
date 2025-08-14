Custom Kasm Chromium Image with SOCKS5 Proxy

This repository contains the files needed to create a custom Kasm Chromium Docker image configured to route all traffic through a specified SOCKS5 proxy.

***

Files

- Dockerfile — Extends the official kasmweb/chromium image and copies the proxy configuration.
- proxy.json — Chromium proxy policy file that configures the SOCKS5 proxy.

***

Prerequisites

- Docker installed locally.
- IP address and port of your SOCKS5 proxy (e.g., a WireGuard VPN container running a SOCKS5 proxy).
- Basic knowledge of Docker commands.

***

Configure Proxy

Edit proxy.json to specify your SOCKS5 proxy:
```
{
  "ProxyMode": "fixed_servers",
  "ProxyServer": "socks5://<PROXY_IP>:<PROXY_PORT>",
  "ProxyBypassList": "<-loopback>"
}
```
- Replace <PROXY_IP> with the IP address of the SOCKS5 proxy server.
- Replace <PROXY_PORT> (commonly 1080) with the proxy port.

Example:
```
{
  "ProxyMode": "fixed_servers",
  "ProxyServer": "socks5://127.0.0.1:1080",
  "ProxyBypassList": "<-loopback>"
}
```
***

Build the Image

Run the following command in the folder with Dockerfile and proxy.json:

docker build -t kasm_chromium_proxy .

This will build a new Docker image tagged kasm_chromium_proxy with the proxy configuration baked in.

***

Usage

Run the custom container as usual, for example:

docker run -d --rm -p 6901:6901 kasm_chromium_proxy

- Access the Chromium browser via noVNC at http://localhost:6901/.
- Traffic from Chromium will be routed through the configured SOCKS5 proxy.

***

Notes

- Ensure the SOCKS5 proxy is accessible from within the container (same Docker network or properly routed).
- Adjust port mappings and volumes as needed for persistent profiles or other configurations.
- This image is based on kasmweb/chromium.

***

If you want to automate builds via CI (e.g., GitHub Actions), include Dockerfile and proxy.json in your repo with your CI build workflow configured.

***

Happy browsing secured via SOCKS5!

***

If you want, I can also help draft a sample GitHub Actions workflow for building this image automatically. Would you like that?

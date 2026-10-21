#!/usr/bin/env bash
# Firewall del servidor Wazuh (laboratorio host-only 192.168.56.0/24)
set -e
sudo ufw default deny incoming
sudo ufw allow from 192.168.56.1 to any port 22 proto tcp      # anfitrión = analista
sudo ufw allow from 192.168.56.1 to any port 443 proto tcp     # Dashboard
sudo ufw allow from 192.168.56.0/24 to any port 1514,1515 proto tcp  # agentes
sudo ufw allow from 192.168.56.20 to any port 514 proto udp    # solo consola Kaspersky (CEF)
sudo ufw --force enable
sudo ufw status numbered

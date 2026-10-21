#!/usr/bin/env bash
# Agente Wazuh en nas-c04-lp. La versión del agente NO puede ser mayor que la del manager.
set -euo pipefail
curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | sudo gpg --no-default-keyring \
  --keyring gnupg-ring:/usr/share/keyrings/wazuh.gpg --import && sudo chmod 644 /usr/share/keyrings/wazuh.gpg
echo "deb [signed-by=/usr/share/keyrings/wazuh.gpg] https://packages.wazuh.com/4.x/apt/ stable main" | \
  sudo tee /etc/apt/sources.list.d/wazuh.list
sudo apt update
sudo WAZUH_MANAGER='192.168.56.10' WAZUH_AGENT_GROUP='linux-nas' WAZUH_AGENT_NAME='nas-c04-lp' apt -y install wazuh-agent
sudo systemctl daemon-reload && sudo systemctl enable --now wazuh-agent
sudo apt-mark hold wazuh-agent   # evita que una actualización deje el agente por encima del manager

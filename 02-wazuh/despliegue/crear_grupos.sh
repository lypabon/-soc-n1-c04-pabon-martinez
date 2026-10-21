#!/usr/bin/env bash
# En wazuh-c04-lp: crea los grupos de agentes del caso C04 y copia sus agent.conf
set -e
for g in windows-estaciones windows-servidores macos-diseno linux-nas; do
  sudo /var/ossec/bin/agent_groups -a -g "$g" -q || true
  sudo cp "../shared/$g/agent.conf" "/var/ossec/etc/shared/$g/agent.conf"
  sudo chown wazuh:wazuh "/var/ossec/etc/shared/$g/agent.conf"
done
sudo /var/ossec/bin/verify-agent-conf
sudo /var/ossec/bin/agent_groups -l

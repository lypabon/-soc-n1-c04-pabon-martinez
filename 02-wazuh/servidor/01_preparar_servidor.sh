#!/usr/bin/env bash
# wazuh-c04-lp — Ubuntu Server 24.04, 4 vCPU, 8 GiB, 50 GB, IP fija 192.168.56.10
# Ejecutar SOLO en la VM del laboratorio. Verificar la versión vigente en https://documentation.wazuh.com
set -euo pipefail
sudo hostnamectl set-hostname wazuh-c04-lp
sudo timedatectl set-timezone America/Bogota
sudo timedatectl set-ntp true
sudo apt update && sudo apt -y upgrade
sudo apt -y install curl tar unzip
curl -sO https://packages.wazuh.com/4.14/wazuh-install.sh
sudo bash ./wazuh-install.sh -a
# La contraseña de admin queda en wazuh-install-files.tar: guardarla en un gestor y NO subirla al repo.
sudo systemctl status wazuh-indexer wazuh-manager wazuh-dashboard --no-pager | grep -E "Active|●"

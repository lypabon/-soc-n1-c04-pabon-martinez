#!/usr/bin/env bash
# glpi-c04-lp en la nube (Ubuntu 24.04). Ejecutar con la llave SSH ya copiada a soc-admin y PROBADA en otra sesión.
set -euo pipefail
ADMIN_IP="${1:?Uso: sudo ./01_hardening.sh <TU_IP_PUBLICA>  (no la escribas en el repositorio)}"
sudo hostnamectl set-hostname glpi-c04-lp
sudo timedatectl set-timezone America/Bogota
id soc-admin &>/dev/null || { sudo adduser --disabled-password --gecos "" soc-admin; sudo usermod -aG sudo soc-admin; }
echo ">> Copie su llave pública a /home/soc-admin/.ssh/authorized_keys y pruebe el acceso ANTES de continuar."
read -rp "¿Acceso con llave probado? (si/no) " ok; [ "$ok" = "si" ] || exit 1
sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin no/; s/^#\?PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo grep -rl "PasswordAuthentication yes" /etc/ssh/sshd_config.d/ 2>/dev/null | xargs -r sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/'
sudo systemctl restart ssh
sudo sshd -T | grep -iE "passwordauthentication|permitrootlogin"
sudo apt update && sudo apt -y upgrade
sudo apt -y install ufw fail2ban unattended-upgrades
sudo ufw default deny incoming
sudo ufw allow from "$ADMIN_IP" to any port 22 proto tcp
sudo ufw allow 80,443/tcp
sudo ufw --force enable
sudo systemctl enable --now fail2ban
sudo dpkg-reconfigure -f noninteractive unattended-upgrades

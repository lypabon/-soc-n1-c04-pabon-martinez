#!/usr/bin/env bash
# Prepara nas-c04-lp (Ubuntu Server 24.04, IP 192.168.56.40) como NAS de proyectos SIMULADO.
# Usuarios y carpetas ficticios. Ejecutar SOLO en la VM del laboratorio.
set -euo pipefail
sudo hostnamectl set-hostname nas-c04-lp
sudo timedatectl set-timezone America/Bogota && sudo timedatectl set-ntp true
sudo apt update && sudo apt -y install samba rsyslog
sudo groupadd -f proyectos
id sprada &>/dev/null || sudo useradd -M -s /usr/sbin/nologin -G proyectos sprada
echo ">> Defina la clave Samba de 'sprada' (no la anote en el informe):"
sudo smbpasswd -a sprada
sudo mkdir -p /srv/proyectos/{cliente_aurora,cliente_brisa,prueba_ransom}
sudo chown -R root:proyectos /srv/proyectos && sudo chmod -R 2770 /srv/proyectos
# Archivos de muestra SIN valor
for c in cliente_aurora cliente_brisa; do
  for i in 1 2 3; do echo "pieza ficticia $i" | sudo tee /srv/proyectos/$c/pieza_$i.txt >/dev/null; done
done
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
sudo bash -c 'cat smb_full_audit.conf >> /etc/samba/smb.conf' 2>/dev/null || \
  echo "!! Copie manualmente el bloque de smb_full_audit.conf al final de /etc/samba/smb.conf"
sudo mkdir -p /var/log/samba
sudo cp rsyslog-samba-audit.conf /etc/rsyslog.d/30-samba-audit.conf
sudo systemctl restart rsyslog smbd
# FIM en tiempo real sobre árboles grandes necesita más inotify watches
echo "fs.inotify.max_user_watches=524288" | sudo tee /etc/sysctl.d/90-wazuh-fim.conf && sudo sysctl --system >/dev/null
testparm -s 2>/dev/null | grep -A8 "\[proyectos\]"
echo "Listo. Desde Windows: \\\\192.168.56.40\\proyectos con el usuario sprada"

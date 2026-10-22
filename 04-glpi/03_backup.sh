#!/usr/bin/env bash
# Instala el respaldo diario de GLPI con retención de 14 días. Copiar luego fuera del servidor.
set -e
sudo mkdir -p /var/backups/glpi && sudo chmod 700 /var/backups/glpi
sudo tee /etc/cron.d/glpi-backup >/dev/null <<'EOF2'
30 2 * * * root mariadb-dump --single-transaction glpidb | gzip > /var/backups/glpi/glpidb_$(date +\%F).sql.gz
40 2 * * * root tar -czf /var/backups/glpi/glpi_files_$(date +\%F).tgz /var/www/glpi/files /var/www/glpi/config 2>/dev/null
50 2 * * * root find /var/backups/glpi -type f -mtime +14 -delete
EOF2
echo "Respaldo programado. Ejecución manual de prueba:"
sudo bash -c 'mariadb-dump --single-transaction glpidb | gzip > /var/backups/glpi/glpidb_$(date +%F).sql.gz'
ls -lh /var/backups/glpi

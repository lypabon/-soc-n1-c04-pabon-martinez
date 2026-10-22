#!/usr/bin/env bash
# Prueba de restauración SIN tocar producción: restaura el último volcado en glpidb_restore y compara conteos.
set -euo pipefail
F=$(ls -t /var/backups/glpi/glpidb_*.sql.gz | head -1)
echo "Restaurando $F en glpidb_restore ($(date '+%F %T %Z'))"
sudo mariadb -e "DROP DATABASE IF EXISTS glpidb_restore; CREATE DATABASE glpidb_restore CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
gunzip -c "$F" | sudo mariadb glpidb_restore
for db in glpidb glpidb_restore; do
  echo -n "$db -> tickets: "; sudo mariadb -N -e "SELECT COUNT(*) FROM $db.glpi_tickets;"
  echo -n "$db -> usuarios: "; sudo mariadb -N -e "SELECT COUNT(*) FROM $db.glpi_users;"
  echo -n "$db -> artículos KB: "; sudo mariadb -N -e "SELECT COUNT(*) FROM $db.glpi_knowbaseitems;"
done
echo "Si los conteos coinciden, la restauración es válida. Capturar esta salida (F04_restauracion.png)."
sudo mariadb -e "DROP DATABASE glpidb_restore;"

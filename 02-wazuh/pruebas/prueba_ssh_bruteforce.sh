#!/usr/bin/env bash
# Desde el ANFITRIÓN o otra VM del laboratorio hacia nas-c04-lp, con un usuario de PRUEBA.
# Esperado: 5760 (fallos) y 5763 (8 en 120 s) + bloqueo firewall-drop 600 s.
# Ojo: si se lanza desde 192.168.56.1 (lista blanca), NO habrá bloqueo; usar otra VM para ver el bloqueo.
# Requiere sshpass. NUNCA ejecutar contra equipos fuera del laboratorio.
TARGET=192.168.56.40
for i in $(seq 1 10); do
  sshpass -p "clave_incorrecta_$i" ssh -o StrictHostKeyChecking=no -o PreferredAuthentications=password \
    -o ConnectTimeout=5 prueba@$TARGET exit 2>/dev/null
  echo "intento $i"
done

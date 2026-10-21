#!/usr/bin/env bash
# Agente Wazuh en los 8 Mac de diseño (MAC-C04-01..08). No probado en laboratorio (sin hardware Apple).
# Descargar el .pkg indicado por el Dashboard para la arquitectura del Mac (Intel o Apple Silicon).
# Verificar el procedimiento vigente en la documentación oficial antes de usar.
set -euo pipefail
PKG="${1:?Uso: sudo ./macos_install.sh wazuh-agent-<VERSION>.<arch>.pkg MAC-C04-NN}"
NAME="${2:?Falta el nombre del equipo, ej. MAC-C04-03}"
echo "WAZUH_MANAGER='10.40.90.10' && WAZUH_AGENT_GROUP='macos-diseno' && WAZUH_AGENT_NAME='$NAME'" > /tmp/wazuh_envs
installer -pkg "$PKG" -target /
/Library/Ossec/bin/wazuh-control start
/Library/Ossec/bin/wazuh-control status
# Lista de chequeo por Mac (~15 min): hora automática activada · agente activo en el Dashboard
# · grupo macos-diseno · carpeta /Users/Shared/Proyectos creada · Kaspersky instalado · GLPI Agent instalado

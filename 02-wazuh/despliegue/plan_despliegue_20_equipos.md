# Plan de despliegue masivo — 20 equipos de Lumbre Digital

Lumbre no tiene Active Directory (identidad en Google Workspace), así que no hay GPO.

| Equipos | Wazuh | Kaspersky | GLPI Agent | Semana |
|---|---|---|---|---|
| Piloto: WS-C04-01, LT-C04-04, MAC-C04-01 | Manual | Paquete autónomo | Manual | 3 |
| 5 estaciones + 3 portátiles Windows restantes | Tarea remota de Kaspersky con paquete personalizado (MSI de Wazuh) | Tarea de instalación remota | Tarea remota de Kaspersky | 4 |
| SRV-C04-FS01 | Manual (grupo windows-servidores) | Kaspersky para servidores | Manual | 4 |
| NAS-C04-01 | `linux_nas_install.sh` | Si la edición lo soporta | Instalador Linux | 4 |
| 7 Mac restantes | `macos_install.sh` uno a uno | Paquete autónomo desde la consola | Instalador .pkg | 4–5 |
| Portátiles fuera de la oficina | Se instalan en la oficina y reportan por VPN | Actualizan por Internet | Inventario por VPN | — |

Verificación: cobertura = agentes activos ÷ 20 (KPI ≥ 98 %), comparando Wazuh y Kaspersky contra el inventario de GLPI.
Un agente desconectado más de 72 h (regla 504 de Wazuh) abre ticket.

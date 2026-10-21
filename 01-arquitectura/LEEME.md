# Arquitectura — agregar aquí
- diagrama_red_c04.drawio + .png (diagrams.net): 7 VLAN, NGFW, switch, 2 AP, host de seguridad (Wazuh + KSC), NAS, FS01,
  Google Workspace, GLPI en la nube, usuarios remotos por VPN.
- diagrama_flujo_logs_c04.drawio + .png: flechas con los puertos de flujos_logs.csv.
- Decisión: Wazuh todo en uno (25 agentes = límite de la guía oficial para 4 vCPU/8 GiB). Retención 90 días + 12 meses archivados.

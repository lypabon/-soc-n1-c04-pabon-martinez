# Kaspersky Security Center → Wazuh (syslog CEF)

1. KSC: Propiedades del servidor de administración → Integración con SIEM (verificar ruta en tu versión):
   syslog, UDP, 192.168.56.10:514, formato CEF; eventos: críticos, fallas funcionales, advertencias.
   Si tu versión/licencia no ofrece CEF, usar formato syslog y ajustar el decoder.
2. Wazuh: bloque `<remote>` syslog 514/udp con `<allowed-ips>192.168.56.20</allowed-ips>` (02-wazuh/manager).
3. UFW: 514/udp solo desde 192.168.56.20 (02-wazuh/servidor/02_ufw.sh).
4. Capturar una línea real: `<logall>yes</logall>` en `<global>`, reiniciar, provocar EICAR,
   `sudo grep -i kaspersky /var/ossec/logs/archives/archives.log | tail`. Apagar logall después.
5. Probar la línea real en `wazuh-logtest`. El decoder `kaspersky-cef` tiene dos variantes:
   con program_name (cuando el pre-decodificador toma "CEF" u otro nombre) y sin él.
   Verificado con líneas de ejemplo en Wazuh 4.14.9: 100201 (detección), 100203 (USB), 100204 (cifrado).

Puertos KSC (verificar en la documentación de tu versión): 13000/TCP agentes TLS, 14000/TCP, 15000/UDP notificaciones,
13291/TCP consola MMC, 8080/TCP consola web.

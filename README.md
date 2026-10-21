# soc-n1-c04-pabon — SOC Nivel 1 para Lumbre Digital S.A.S. (caso C04)

Repositorio PRIVADO del parcial de Ética del Hacking (UTS). Compartir solo con el docente.
Todos los datos (empresa, empleados, dominios, IP) son ficticios. Ningún archivo contiene secretos:
las contraseñas aparecen como `CAMBIAR_CLAVE` y los dominios usan `*.example`.

| Carpeta | Contenido | Fase |
|---|---|---|
| 00-alcance | Supuestos, inventario (Anexo A), matriz de riesgos (Anexo B) | 0 |
| 01-arquitectura | VLAN, flujos de logs; diagramas .drawio y .png (agregar) | 1 |
| 02-wazuh | Scripts del servidor, ossec.conf (fragmentos), agent.conf por grupo, reglas, decoders, despliegue y pruebas | 2 |
| 03-kaspersky | Políticas, exclusiones, integración SIEM (CEF) | 3 |
| 04-glpi | Hardening, instalación, respaldo/restauración, usuarios, categorías, SLA, reglas, base de conocimiento | 4 |
| 05-ngfw | Requisitos, correo de cotización, consolidado y matriz (agregar PDFs de cotizaciones) | 5 |
| 06-procesos | Playbooks PB-01..PB-09, plantilla de escalamiento, tickets de ejemplo | 6 |
| 07-presupuesto | Presupuesto (CSV), RACI | 7 |
| 08-video | Guion y enlace del video | 8 |
| scripts | Revisión de secretos antes de cada commit | — |

## Reproducir el laboratorio (resumen)
Red host-only VirtualBox 192.168.56.0/24:
`wazuh-c04-lp` .10 · `ksc-c04-lp` .20 · `win11-c04-lp` .30 · `nas-c04-lp` .40 · `glpi-c04-lp` en la nube.

1. `02-wazuh/servidor/01_preparar_servidor.sh` y `02_ufw.sh` en wazuh-c04-lp.
2. `02-wazuh/despliegue/crear_grupos.sh`; copiar `02-wazuh/shared/*` a `/var/ossec/etc/shared/`.
3. Copiar `rules/local_rules.xml` y `decoders/local_decoder.xml` a `/var/ossec/etc/{rules,decoders}/`, probar con `wazuh-logtest` usando `pruebas/logtest_muestras.txt`, reiniciar el manager.
4. Agregar los bloques de `manager/ossec_fragmentos.xml` a `/var/ossec/etc/ossec.conf`.
5. NAS: `02-wazuh/nas/setup_nas_lab.sh` y luego `despliegue/linux_nas_install.sh`.
6. Windows: `despliegue/auditpol_usb.ps1` y `despliegue/windows_install.ps1`.
7. Pruebas: `pruebas/prueba_fim_nas.sh`, `pruebas/simular_ransomware.ps1`, `pruebas/prueba_ssh_bruteforce.sh`.
8. GLPI: `04-glpi/01_hardening.sh`, `02_instalar_glpi.sh`, `03_backup.sh`, `04_restore_test.sh`.

IMPORTANTE: verificar cada comando contra la documentación oficial de la versión instalada. Varios IDs de reglas
y rutas de menú dependen de la versión. Ejecutar SOLO en las VM propias del laboratorio.

Antes de cada commit: `bash scripts/revisar_secretos.sh`.

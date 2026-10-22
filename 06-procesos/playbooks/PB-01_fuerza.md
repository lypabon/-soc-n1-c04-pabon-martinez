# PB-01 — Fuerza bruta SSH / RDP

| Campo | Contenido |
|---|---|
| ID y nombre | PB-01 — Fuerza bruta SSH / RDP |
| Objetivo | Detectar y frenar intentos de adivinar contraseñas contra el NAS o el servidor de archivos. |
| Disparador y fuente | Wazuh 5760/5763 (sshd en NAS-C04-01); 60122 repetidos en SRV-C04-FS01 (RDP/SMB); NGFW (VPN). |
| Severidad inicial | Media. Sube a Alta si hay inicio exitoso posterior, si la cuenta es administradora o si el origen es interno (VLAN 10/20/40). Baja si es la prueba autorizada del laboratorio. |
| Contención permitida a N1 | Confirmar el bloqueo automático de 10 min; si es externa, bloquear la IP en el NGFW por 24 h. Pedir a TI bloquear la cuenta objetivo si no es privilegiada. |
| Acciones que N1 NO debe realizar | Reiniciar servicios, cambiar claves de cuentas administradoras, desbloquear IPs de la lista negra sin ticket. |
| Evidencia a guardar | IDs de alerta, número de intentos, IP, usuarios, captura del tablero, salida de iptables -L. |
| Escalar a N2 cuando | Inicio exitoso tras los fallos, cuenta privilegiada, origen interno. |
| Cierre y documentación en GLPI | Ticket con plantilla "Alerta de seguridad", clasificación, acciones con hora y solución. Categoría según 04-glpi/categorias_itil.csv. |
| Mejora continua | Recomendar llaves SSH sin contraseña en el NAS, RDP solo desde LT-C04-04, MFA en VPN; revisar umbral. |
| Responsable, versión, revisión | Responsable del SOC · v1.0 · 19/10/2026 · revisar cada 3 meses |

## Triage paso a paso
1. ¿IP de origen interna o externa? Si es interna, ¿qué equipo es según el inventario de GLPI?
2. ¿Cuántos intentos, contra cuántos usuarios y en qué ventana? (umbral de la regla: 8 en 120 s)
3. ¿Hubo un inicio exitoso (5715 / 4624) con el mismo usuario o desde la misma IP después de los fallos?
4. ¿Active response bloqueó la IP? Revisar active-responses.log del NAS.
5. ¿Es una prueba autorizada o un usuario que olvidó su clave (confirmar por llamada)?

Publicado en la base de conocimiento de GLPI (visible para SOC N1 y SOC N2).

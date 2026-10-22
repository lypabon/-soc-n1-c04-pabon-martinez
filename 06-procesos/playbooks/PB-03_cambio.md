# PB-03 — Cambio en archivos críticos (FIM)

| Campo | Contenido |
|---|---|
| ID y nombre | PB-03 — Cambio en archivos críticos (FIM) |
| Objetivo | Distinguir cambios autorizados de manipulaciones en configuración del NAS y del servidor. |
| Disparador y fuente | Wazuh 550/553/554 en /etc/samba, /etc/ssh, /etc/sudoers.d (NAS) y C:\Windows\System32\drivers\etc, llaves Run (Windows). |
| Severidad inicial | Baja/Media con ticket de cambio. Alta sin ticket o fuera de ventana. Crítica si afecta autenticación, Samba o binarios. |
| Contención permitida a N1 | No modificar ni revertir el archivo. Si hay indicio de compromiso, escalar y pedir aislamiento a N2. |
| Acciones que N1 NO debe realizar | Revertir cambios, borrar el archivo, cambiar reglas FIM para silenciar. |
| Evidencia a guardar | Datos de syscheck (hash antes/después, diff), ticket de cambio, capturas. |
| Escalar a N2 cuando | Sin ticket en servidor/NAS; cambios en Samba, SSH, sudoers o persistencia. |
| Cierre y documentación en GLPI | Ticket con plantilla "Alerta de seguridad", clasificación, acciones con hora y solución. Categoría según 04-glpi/categorias_itil.csv. |
| Mejora continua | Si es legítimo, vincular al ticket y cerrar como benigno; proponer ignore si es ruido recurrente. |
| Responsable, versión, revisión | Responsable del SOC · v1.0 · 19/10/2026 · revisar cada 3 meses |

## Triage paso a paso
1. ¿Hay ticket de Cambio aprobado en GLPI para esa hora?
2. ¿Qué usuario/proceso lo hizo? (report_changes muestra el diff en configs)
3. ¿Qué cambió: hash, permisos, contenido?
4. ¿Coincide con una actualización de paquetes (apt / Windows Update)?
5. ¿Es una entrada nueva en Run/LaunchAgents (persistencia)?

Publicado en la base de conocimiento de GLPI (visible para SOC N1 y SOC N2).

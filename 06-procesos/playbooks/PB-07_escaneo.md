# PB-07 — Escaneo de puertos / reconocimiento

| Campo | Contenido |
|---|---|
| ID y nombre | PB-07 — Escaneo de puertos / reconocimiento |
| Objetivo | Detectar equipos de invitados o internos que exploran la red hacia el NAS. |
| Disparador y fuente | NGFW (IPS, denegaciones) → Wazuh; muchas conexiones denegadas desde una IP. |
| Severidad inicial | Baja si es externo y bloqueado. Media si es interno o repetido. Alta si viene de VLAN Invitados o Diseño hacia Servidores, o va seguido de intentos de acceso. |
| Contención permitida a N1 | Bloquear temporalmente IP externa en el NGFW. Si es interno, identificar el equipo y escalar. |
| Acciones que N1 NO debe realizar | Escanear de vuelta al origen, desconectar físicamente equipos de terceros. |
| Evidencia a guardar | Logs del NGFW, puertos, hora, IP. |
| Escalar a N2 cuando | Origen interno, objetivo NAS/FS01 o explotación posterior. |
| Cierre y documentación en GLPI | Ticket con plantilla "Alerta de seguridad", clasificación, acciones con hora y solución. Categoría según 04-glpi/categorias_itil.csv. |
| Mejora continua | Verificar que la VLAN 40 no llega a ninguna VLAN interna; registrar la IP como indicador. |
| Responsable, versión, revisión | Responsable del SOC · v1.0 · 19/10/2026 · revisar cada 3 meses |

## Triage paso a paso
1. ¿Origen externo o interno? ¿Qué VLAN?
2. ¿Qué puertos (445 SMB, 22, 3389)?
3. ¿Alguna conexión permitida?
4. ¿Siguieron intentos de inicio de sesión (PB-01) desde la misma IP?
5. ¿Es un escaneo autorizado (auditoría programada)?

Publicado en la base de conocimiento de GLPI (visible para SOC N1 y SOC N2).

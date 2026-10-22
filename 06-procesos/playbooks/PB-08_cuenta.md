# PB-08 — Cuenta privilegiada nueva o elevación de privilegios

| Campo | Contenido |
|---|---|
| ID y nombre | PB-08 — Cuenta privilegiada nueva o elevación de privilegios |
| Objetivo | Detectar persistencia de un atacante mediante nuevas cuentas administradoras. |
| Disparador y fuente | Wazuh: miembro agregado a Administradores (4732), cuenta creada (4720), cambios en /etc/sudoers.d (FIM); nuevo administrador en Google Workspace (reportado). |
| Severidad inicial | Alta por defecto. Crítica sin solicitud en el NAS, el servidor o Workspace. |
| Contención permitida a N1 | Si no está autorizada, pedir a TI/N2 deshabilitar la cuenta y revertir la membresía. |
| Acciones que N1 NO debe realizar | Eliminar cuentas privilegiadas (lo hace N2). |
| Evidencia a guardar | Eventos de creación y cambio de grupo, ticket, línea de tiempo. |
| Escalar a N2 cuando | Siempre que no exista autorización documentada. |
| Cierre y documentación en GLPI | Ticket con plantilla "Alerta de seguridad", clasificación, acciones con hora y solución. Categoría según 04-glpi/categorias_itil.csv. |
| Mejora continua | Si es autorizada, vincular el ticket; si no, entregar a N2. |
| Responsable, versión, revisión | Responsable del SOC · v1.0 · 19/10/2026 · revisar cada 3 meses |

## Triage paso a paso
1. ¿Hay ticket de Solicitud aprobado por la gerente?
2. ¿Quién lo hizo y desde dónde?
3. ¿A qué hora (fuera de horario)?
4. ¿La cuenta ya se usó?
5. ¿Otros cambios simultáneos (FIM, nuevos servicios)?

Publicado en la base de conocimiento de GLPI (visible para SOC N1 y SOC N2).

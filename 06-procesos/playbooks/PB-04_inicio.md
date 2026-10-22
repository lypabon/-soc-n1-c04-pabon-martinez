# PB-04 — Inicio de sesión fuera de horario o anómalo

| Campo | Contenido |
|---|---|
| ID y nombre | PB-04 — Inicio de sesión fuera de horario o anómalo |
| Objetivo | Detectar el uso de credenciales robadas, especialmente de quien administra cuentas de clientes. |
| Disparador y fuente | Wazuh 100100 / 100101 (Windows fuera de horario o fin de semana); VPN desde ubicación inusual (NGFW); aviso de Google sobre inicio sospechoso reportado por el usuario. |
| Severidad inicial | Baja/Media para usuario estándar. Alta si es la gerente (mrueda) o el community manager (facevedo), que tienen acceso a cuentas de clientes. Crítica si siguen acciones sobre cuentas de clientes. |
| Contención permitida a N1 | Si no es legítimo: forzar cierre de sesiones y cambio de clave en Workspace (cuenta no privilegiada) y pedir a TI bloquear la cuenta. |
| Acciones que N1 NO debe realizar | Cambiar roles en cuentas de clientes, eliminar cuentas, contactar al cliente (lo hace la gerencia). |
| Evidencia a guardar | Evento de inicio, IP, hora, ubicación aproximada, respuesta del usuario. |
| Escalar a N2 cuando | Cuenta con acceso a clientes, acciones posteriores, usuario no reconoce el acceso. |
| Cierre y documentación en GLPI | Ticket con plantilla "Alerta de seguridad", clasificación, acciones con hora y solución. Categoría según 04-glpi/categorias_itil.csv. |
| Mejora continua | Documentar excepciones autorizadas (render nocturno); recomendar MFA y alertas de inicio en Workspace. |
| Responsable, versión, revisión | Responsable del SOC · v1.0 · 19/10/2026 · revisar cada 3 meses |

## Triage paso a paso
1. ¿Había trabajo autorizado (render nocturno, entrega urgente)? Revisar tickets y calendario.
2. ¿IP y ubicación habituales?
3. ¿Viaje imposible (dos ubicaciones lejanas en poco tiempo)?
4. ¿Qué hizo luego: descargas masivas del NAS, cambios de roles en Meta Business o Google Ads?
5. Confirmar con el usuario por llamada, nunca respondiendo al correo sospechoso.

Publicado en la base de conocimiento de GLPI (visible para SOC N1 y SOC N2).

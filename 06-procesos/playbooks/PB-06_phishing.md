# PB-06 — Phishing reportado

| Campo | Contenido |
|---|---|
| ID y nombre | PB-06 — Phishing reportado |
| Objetivo | Atender en minutos el correo sospechoso reportado y evitar la toma de cuentas de clientes. |
| Disparador y fuente | Ticket creado por el receptor de GLPI desde reporte-phishing@lumbredigital.example; reporte verbal a TI. |
| Severidad inicial | Baja sin interacción. Media si abrió el enlace o el adjunto HTML. Alta si ingresó credenciales de Workspace o de una plataforma de un cliente. Crítica si la cuenta comprometida administra cuentas de clientes o es la gerente. |
| Contención permitida a N1 | Pedir no interactuar; bloquear dominio/URL en el NGFW (y control web de Kaspersky); pedir a TI borrar el correo de otros buzones; si hubo credenciales: cambio inmediato, cierre de sesiones y revisión de reglas de reenvío y de accesos a cuentas de clientes. |
| Acciones que N1 NO debe realizar | Responder al atacante, reenviar el correo a todos 'como advertencia' con el enlace activo, cambiar roles en cuentas de clientes. |
| Evidencia a guardar | Archivo .eml en carpeta restringida, encabezados, URL, hash del adjunto, lista de destinatarios. |
| Escalar a N2 cuando | Credenciales ingresadas, adjunto ejecutado, varios destinatarios, suplantación de un cliente o de la gerente. |
| Cierre y documentación en GLPI | Ticket con plantilla "Alerta de seguridad", clasificación, acciones con hora y solución. Categoría según 04-glpi/categorias_itil.csv. |
| Mejora continua | Agradecer al usuario (refuerza el reporte), bloquear dominio, actualizar KB-11, medir el KPI de reporte. |
| Responsable, versión, revisión | Responsable del SOC · v1.0 · 19/10/2026 · revisar cada 3 meses |

## Triage paso a paso
1. ¿Qué pide el correo: iniciar sesión en Google, 'aprobar acceso' a una página de Meta, pago, adjunto?
2. ¿El usuario hizo clic, descargó o escribió su clave? (preguntar sin culpar)
3. ¿Quién más lo recibió? (búsqueda en la consola de Workspace por remitente/asunto)
4. Revisar encabezados (Return-Path, SPF/DKIM), dominio parecido y URL sin abrirla en un equipo de producción.
5. Reputación de URL/dominio/hash en fuentes públicas sin subir adjuntos con datos de clientes.

Publicado en la base de conocimiento de GLPI (visible para SOC N1 y SOC N2).

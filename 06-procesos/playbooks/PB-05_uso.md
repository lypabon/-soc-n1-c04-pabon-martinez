# PB-05 — Uso de USB no autorizado

| Campo | Contenido |
|---|---|
| ID y nombre | PB-05 — Uso de USB no autorizado |
| Objetivo | Evitar fuga de material de campañas sin publicar y entrada de malware por USB. |
| Disparador y fuente | Kaspersky control de dispositivos → Wazuh 100203; Windows 6416 → 60227 → 100400. |
| Severidad inicial | Baja si fue bloqueado. Media si es un SSD aprobado usado por otro usuario o si hubo copia. Alta si se copió material sin publicar de clientes o el usuario está de salida. |
| Contención permitida a N1 | Mantener el bloqueo; pedir retirar el dispositivo. Si hubo copia de material confidencial, escalar a N2 y al responsable. |
| Acciones que N1 NO debe realizar | Agregar el dispositivo a la lista de confianza (es un Cambio aprobado), revisar el contenido personal del USB. |
| Evidencia a guardar | Evento de control de dispositivos, ID/serie, usuario, hora, volumen. |
| Escalar a N2 cuando | Copia de datos de clientes, malware en el dispositivo, reincidencia. |
| Cierre y documentación en GLPI | Ticket con plantilla "Alerta de seguridad", clasificación, acciones con hora y solución. Categoría según 04-glpi/categorias_itil.csv. |
| Mejora continua | Recordar la política (KB-12); si hay necesidad real, tramitar Solicitud > Autorización de USB. |
| Responsable, versión, revisión | Responsable del SOC · v1.0 · 19/10/2026 · revisar cada 3 meses |

## Triage paso a paso
1. ¿Bloqueado o permitido?
2. ¿Qué usuario y qué equipo?
3. ¿Está en la lista de 3 SSD de producción aprobados (número de serie)?
4. ¿Qué archivos y volumen se copiaron (eventos de Kaspersky / FIM en C:\Proyectos)?
5. ¿Kaspersky analizó el dispositivo? ¿Hubo detección?

Publicado en la base de conocimiento de GLPI (visible para SOC N1 y SOC N2).

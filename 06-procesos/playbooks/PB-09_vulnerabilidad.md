# PB-09 — Vulnerabilidad crítica

| Campo | Contenido |
|---|---|
| ID y nombre | PB-09 — Vulnerabilidad crítica |
| Objetivo | Priorizar parches en el software que abre archivos de clientes y de Internet. |
| Disparador y fuente | Wazuh detección de vulnerabilidades (CVE crítico/alto) en cualquier agente. |
| Severidad inicial | Media por defecto. Alta si es explotable remotamente, hay explotación activa conocida o afecta navegador, Adobe, códecs o el NAS. Baja si el software no se usa. |
| Contención permitida a N1 | Crear ticket de gestión de vulnerabilidad con responsable (Admin. TI) y fecha límite; proponer mitigación temporal con aprobación. |
| Acciones que N1 NO debe realizar | Instalar parches en producción sin ticket de Cambio. |
| Evidencia a guardar | CVE, paquete y versión, activo, verificación. |
| Escalar a N2 cuando | Explotación activa, activo crítico expuesto o sin parche. |
| Cierre y documentación en GLPI | Ticket con plantilla "Alerta de seguridad", clasificación, acciones con hora y solución. Categoría según 04-glpi/categorias_itil.csv. |
| Mejora continua | Confirmar con nuevo análisis del agente; KPI CVE críticos > 30 días = 0. |
| Responsable, versión, revisión | Responsable del SOC · v1.0 · 19/10/2026 · revisar cada 3 meses |

## Triage paso a paso
1. ¿El software está instalado y en uso?
2. ¿El equipo está expuesto (portátil fuera de la oficina, NAS)?
3. ¿Hay parche o mitigación?
4. ¿Hay indicios de explotación en los registros?
5. ¿Criticidad del activo en el inventario?

Publicado en la base de conocimiento de GLPI (visible para SOC N1 y SOC N2).

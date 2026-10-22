# Manual del SOC N1 — Lumbre Digital S.A.S.

El manual completo está en el capítulo 8 del informe técnico (roles, matriz de severidad, flujo de triage,
acciones permitidas/prohibidas, escalamiento, turnos, SLA y KPIs). Este directorio contiene los artefactos operativos:

- playbooks/PB-01 … PB-09 (formato Anexo F; publicados en la KB de GLPI)
- plantilla_escalamiento.md
- tickets_ejemplo.md
- Informe de incidente INC-C04-001: Anexo D del informe.

## Relevo de turno (checklist diario, ticket "Relevo SOC <fecha>")
- [ ] Alertas abiertas y su estado
- [ ] Tickets con SLA por vencer
- [ ] Incidentes en curso y acuerdos con N2
- [ ] Cambios programados (ventanas)
- [ ] Falsos positivos conocidos / reglas en ajuste
- [ ] Agentes desconectados (> 72 h)

## Turnos
| Franja | Cobertura | Responsable |
|---|---|---|
| L–V 7:00–16:00 | Activo | Óscar (N1 interno) |
| L–V 13:00–19:00 | Activo remoto | Proveedor externo |
| Noches | Guardia Alta/Crítica, respuesta 30 min | Rotación semanal |
| Fines de semana/festivos | Guardia + tablero 10:00 y 18:00 | Rotación semanal |

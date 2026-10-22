# KB-10 — Matriz de severidad y procedimiento de escalamiento a N2 (SOC N1 y N2)

| Severidad | Criterio | Reconocer | Escalar a N2 | Notificar |
|---|---|---|---|---|
| Crítica | Compromiso confirmado de activo crítico (cifrado en NAS, cuenta de cliente tomada) | 15 min | ≤ 15 min tras confirmar | Responsable SOC y gerencia por llamada |
| Alta | Actividad maliciosa probable (credenciales ingresadas en phishing, malware ejecutado) | 30 min | ≤ 30 min | Responsable SOC |
| Media | Sospechosa, requiere validación | 2 h | Según playbook | Ticket |
| Baja | Bajo riesgo o con control compensatorio | 8 h hábiles | No | Ticket |
| Informativa | Auditoría | 1 día hábil | No | — |

## Cómo escalar
1. Completar la plantilla de escalamiento (06-procesos/plantilla_escalamiento.md) como seguimiento del ticket.
2. Asignar el ticket al grupo SOC N2 (sin quitar a SOC N1).
3. Llamar a N2 si es Alta o Crítica (contactos en la matriz de contactos de la bitácora del SOC).
4. N2 debe reconocer en 30 min (Crítica), 2 h (Alta) o el siguiente día hábil (Media) — OLA.
5. El N1 sigue disponible para N2 hasta el cierre.

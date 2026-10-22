# Reglas de negocio para tickets (Administración → Reglas → Reglas de negocio para tickets)

| Regla | Criterios | Acciones | Orden |
|---|---|---|---|
| RN-01 Asignar SOC | Categoría *está bajo* Seguridad | Grupo asignado = SOC N1 | 1 |
| RN-02 Riesgos críticos C04 | Categoría = Ransomware **o** Fuga de datos **o** Cuentas de clientes | Urgencia = Muy alta; Impacto = Alto | 2 |
| RN-03 Activo crítico | Elemento asociado = NAS-C04-01 o SRV-C04-FS01 | Impacto = Alto | 3 |
| RN-04 SLA por prioridad | Prioridad = Mayor / Muy alta / Media / Baja / Muy baja | SLA TTO y TTR según sla_ola.csv | 4 |
| RN-05 Buzón de phishing | Origen de la solicitud = Correo **y** receptor = reporte-phishing@ | Categoría = Phishing; Plantilla = Alerta de seguridad; Grupo = SOC N1 | 0 |
| RN-06 Cambios a N2 | Categoría está bajo Cambio | Grupo asignado = SOC N2 | 5 |

Verificar con "Probar" en cada regla (botón de prueba del motor de reglas) y capturar el resultado.

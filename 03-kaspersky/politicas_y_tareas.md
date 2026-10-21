# Kaspersky — políticas, tareas y respuesta (caso C04)

Edición elegida: Kaspersky Next EDR Optimum con Kaspersky Security Center local (ksc-c04-lp, 192.168.56.20).
Alternativa si no cabe en OPEX: EDR Foundations (sin EDR completo ni cifrado). Fuente de la comparación:
https://support.kaspersky.com/help/NextPro/1.0/en-US/101540.htm (consultada 19/10/2026).
Licencia de prueba: activada el [COMPLETAR], vence el [COMPLETAR].

## Grupos de administración
| Grupo | Equipos | Política |
|---|---|---|
| Diseño macOS | MAC-C04-01..08 | macOS: tiempo real, web, dispositivos |
| Producción Windows | WS-C04-01..06 | Estaciones: USB solo SSD aprobados, análisis 12:30 |
| Portátiles remotos | LT-C04-01..04 | Portátiles: actualización por Internet, cifrado de disco, USB bloqueado |
| Servidores | SRV-C04-FS01 (+ NAS si compatible) | Protección contra cifrado de carpetas compartidas, USB bloqueado |
| Laboratorio | win11-c04-lp | Copia de Estaciones, separada |

## Políticas
| Componente | Valor | Motivo (escenario C04) |
|---|---|---|
| Protección de archivos/correo/web | Activa; desinfectar → cuarentena | Adjuntos y descargas |
| Detección de comportamiento + remediación | Activa, revertir acciones | Ransomware sin firma (esc. 2) |
| Protección contra cifrado de carpetas compartidas | Activa en servidor/NAS | Bloquea al equipo remoto que cifra (esc. 2) |
| Control de dispositivos | Almacenamiento USB bloqueado; confianza: 3 SSD de producción por número de serie | Esc. 3; camarógrafos necesitan SSD |
| Control web | Bloquear phishing, malware, anonimizadores, software pirata/cracks | Esc. 1 y plugins piratas |
| Firewall | Activo, perfiles Oficina/Pública | Portátiles fuera |
| Contraseña de protección | Para desinstalar/desactivar | Evitar que se apague |
| Cifrado de disco | Portátiles | Pérdida/robo |

## Tareas
| Tarea | Frecuencia |
|---|---|
| Actualizar bases | Cada hora |
| Análisis áreas críticas | Diario 12:30 |
| Análisis completo | Sábado, escalonado |
| Inventario software/vulnerabilidades | Semanal |
| Instalar Wazuh y GLPI Agent (paquete personalizado) | Bajo demanda |

## Matriz de respuesta
| Acción | N1 | N2/responsable |
|---|---|---|
| Cuarentena | Sí | Sí |
| Aislar equipo | Solo Alta/Crítica, avisa a N2 | Sí; levanta aislamiento |
| Terminar proceso | Si el playbook lo autoriza | Sí |
| Restaurar/reinstalar | No | Sí con aprobación |
| Cambiar políticas/exclusiones | No (propone) | Sí con ticket de Cambio |

## Plan de despliegue
Semana 3 piloto (2 Windows + 1 Mac); semana 4 tarea remota al resto de Windows y servidor; Mac con paquete autónomo;
portátiles fuera de la oficina con paquete autónomo + VPN. Cobertura ≥ 98 % contra inventario GLPI.

# Tickets del laboratorio (mínimo 6; al menos 3 de alertas reales)

Llenar los [ ] con los datos REALES de tu laboratorio. No marcar como "real" lo que fue simulado.

---
## T1 — [Wazuh] [100322] – Renombrado masivo en NAS desde win11-c04-lp   · REAL (script de simulación inofensivo)
Categoría: Seguridad > Ransomware · Origen: Wazuh · Elemento: NAS-C04-01 · Urgencia Muy alta / Impacto Alto → Mayor (Crítica)
- ID de regla / alerta: 100322 (y [100323/100300 si aparecieron]) · ID alerta: [ ]
- Fecha y hora: [ ]
- Activo y usuario: nas-c04-lp, recurso proyectos · usuario Samba sprada (ficticio) · origen win11-c04-lp
- IP: origen 192.168.56.30 → destino 192.168.56.40
- Qué ocurrió: [N] archivos renombrados a .c04x en < 60 s desde una estación de video. Patrón de ransomware.
- Enriquecimiento: equipo en inventario = WS-C04-01 (estación de video, criticidad 3); sin ticket de cambio; Kaspersky sin detección previa [verificar].
- Evidencias: alerta 100322, líneas de /var/log/samba/audit.log, active-responses.log (firewall-drop add 192.168.56.30), captura iptables.
- Acciones N1: [hh:mm] confirmó bloqueo automático · [hh:mm] aisló win11-c04-lp desde Kaspersky · [hh:mm] desmontó la unidad · [hh:mm] escaló con plantilla.
- Clasificación: verdadero positivo (simulación autorizada del laboratorio).
- Decisión: escalar a N2 → informe de incidente INC-C04-001.
- Mejora: revisar umbral 20/60 s tras un mes; respaldo inmutable del NAS.

## T2 — [Wazuh] [5763] – Fuerza bruta SSH contra nas-c04-lp   · REAL
Categoría: Seguridad > Acceso no autorizado · Prioridad Media
- Hora [ ] · origen [IP de la VM atacante del lab] · usuario objetivo: prueba · intentos: [ ] en [ ] s
- Verificación: sin inicio exitoso posterior (sin 5715) · active response bloqueó 600 s
- Clasificación: verdadero positivo (prueba autorizada) · Decisión: cerrar · Mejora: SSH solo con llave en el NAS.

## T3 — [Kaspersky] [100201] – EICAR detectado en win11-c04-lp   · REAL
Categoría: Seguridad > Malware / EDR · Prioridad Media
- Hora en Kaspersky [ ] · hora en Wazuh [ ] (MTTD = diferencia) · archivo eicar.com en Descargas · acción: cuarentena
- Hash SHA-256 [ ] (archivo de prueba estándar)
- Clasificación: verdadero positivo de prueba · Decisión: cerrar tras análisis rápido sin otras detecciones.

## T4 — [Kaspersky] [100203] / [Wazuh] [100400] – USB bloqueado en win11-c04-lp   · REAL (USB virtual)
Categoría: Seguridad > Dispositivos extraíbles · Prioridad Baja
- Dispositivo [descripción/serie] · usuario [ ] · bloqueado: sí · copia de archivos: no
- Decisión: cerrar; recordar KB-12.

## T5 — [Wazuh] [vulnerabilidad] – CVE crítico en win11-c04-lp   · REAL
Categoría: Seguridad > Vulnerabilidades · Prioridad Media
- CVE [ ] · paquete y versión [ ] · severidad [ ] · ¿parche disponible? [ ]
- Acción: ticket a Admin. TI con fecha límite [ ] · Decisión: queda abierto hasta verificar con nuevo escaneo (o cerrar si ya se parchó).

## T6 — [Usuario] [phishing] – Diseñadora reporta correo con adjunto HTML que pide iniciar sesión   · SIMULADO
(Correo de prueba inofensivo enviado desde una cuenta del ejercicio al buzón reporte-phishing@ de prueba; el receptor de GLPI creó el ticket.)
Categoría: Seguridad > Phishing · Origen: Usuario (correo) · Prioridad Media
- Remitente simulado: soporte@g00gle-workspace.example · asunto: "Su cuenta será suspendida" · adjunto factura.html
- Triage: SPF/DKIM fallan [o: no aplica en simulación]; el HTML contiene formulario de inicio de sesión falso; la usuaria NO ingresó datos; 1 destinatario.
- Acciones: bloquear dominio en NGFW (procedimiento documentado; NGFW no instalado) y en control web de Kaspersky; agradecer a la usuaria.
- Clasificación: verdadero positivo (simulado) · Decisión: cerrar · Mejora: simulacro trimestral.

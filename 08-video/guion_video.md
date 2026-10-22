# Guion del video (12–15 min, 1080p, voz propia, funcionamiento REAL). Mostrar caso C04 y fecha en pantalla.

| Tiempo | Qué mostrar | Qué decir (idea, con tus palabras) |
|---|---|---|
| 0:00–1:00 | Portada del informe | Quién soy, Lumbre Digital, los 2 riesgos: phishing y ransomware en el NAS |
| 1:00–3:00 | Diagrama de red | Por qué 7 VLAN; el NAS separado de diseño; Wazuh en VLAN de seguridad |
| 3:00–6:00 | Dashboard Wazuh | Agentes activos, FIM, SCA, vulnerabilidades, regla 100323 en wazuh-logtest, bloqueo AR, tablero SOC N1 |
| 6:00–8:00 | Consola Kaspersky | Grupos, política USB y web, exclusiones (y por qué no se excluye Proyectos), EICAR → alerta 100201 en Wazuh |
| 8:00–11:00 | GLPI | HTTPS, entidades, usuarios, categorías Ransomware/Cuentas de clientes, SLA, plantilla, KB, inventario, correo recibido |
| 11:00–12:30 | Matriz NGFW y presupuesto | 3 cotizaciones reales, TCO, si cabe en el tope |
| 12:30–14:30 | ALERTA DE PRINCIPIO A FIN | simular_ransomware.ps1 → 100322 en Wazuh → IP bloqueada en NAS → ticket con plantilla → PB-02 paso a paso → aislar en Kaspersky → escalar a N2 |
| 14:30–15:00 | Conclusión | Limitaciones (Mac, Workspace sin logs), qué aprendí |

Antes de publicar: revisar que no se vea ninguna contraseña, IP pública real, correo personal ni token.
Enlace del video (no listado): [COMPLETAR]

# Relé de correo para las alertas de Wazuh (nivel >= 10)

Wazuh envía correo sin autenticación a `smtp_server`; por eso se usa Postfix local como relé.
Usar una cuenta creada SOLO para el ejercicio, con contraseña de aplicación.

```bash
sudo apt -y install postfix mailutils libsasl2-modules   # elegir "Satellite system"; relayhost [smtp.gmail.com]:587
sudo tee -a /etc/postfix/main.cf >/dev/null <<'CONF'
relayhost = [smtp.gmail.com]:587
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
smtp_tls_security_level = encrypt
CONF
echo "[smtp.gmail.com]:587 cuenta-ejercicio@gmail.com:CAMBIAR_CLAVE" | sudo tee /etc/postfix/sasl_passwd
sudo chmod 600 /etc/postfix/sasl_passwd && sudo postmap /etc/postfix/sasl_passwd
sudo systemctl restart postfix
echo "Prueba relé Wazuh C04" | mail -s "Prueba SOC C04" soc-n1@lumbredigital.example
```
`/etc/postfix/sasl_passwd` NUNCA se sube al repositorio.

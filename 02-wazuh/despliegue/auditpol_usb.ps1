# Habilita la auditoría de Plug and Play (evento 6416) para detectar USB en Wazuh (reglas 60227 -> 100400).
# PowerShell como administrador. En producción se aplicaría por política local en las 11 máquinas Windows.
auditpol /set /subcategory:"Plug and Play Events" /success:enable
# Si el sistema está en español y falla, usar el GUID de la subcategoría:
# auditpol /set /subcategory:"{0CCE9248-69AE-11D9-BED3-505054503030}" /success:enable
auditpol /get /subcategory:"{0CCE9248-69AE-11D9-BED3-505054503030}"

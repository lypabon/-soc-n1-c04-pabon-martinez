# SIMULACIÓN INOFENSIVA de ransomware — SOLO en win11-c04-lp contra el NAS simulado del laboratorio.
# No cifra nada: crea 40 archivos de texto falsos en el recurso compartido y les cambia la extensión.
# Esperado: 100322 (renombrado masivo, Samba) y active response: el NAS bloquea 192.168.56.30 por 30 min.
# Al bloquearse la IP, el script empezará a fallar: ESA es la evidencia de la contención automática.
param([string]$Share = "\\192.168.56.40\proyectos\prueba_ransom")
if (-not (Test-Path $Share)) { Write-Error "Monte primero el recurso (net use) con el usuario de prueba"; exit 1 }
1..40 | ForEach-Object { Set-Content -Path "$Share\documento_$_.txt" -Value "contenido ficticio $_" }
Start-Sleep -Seconds 5
$t0 = Get-Date
foreach ($i in 1..40) {
  try {
    Rename-Item -Path "$Share\documento_$i.txt" -NewName "documento_$i.txt.c04x" -ErrorAction Stop
    Write-Host "renombrado $i"
  } catch {
    Write-Host ("BLOQUEADO en el archivo {0} tras {1:N1} s: {2}" -f $i, ((Get-Date)-$t0).TotalSeconds, $_.Exception.Message) -ForegroundColor Yellow
    break
  }
}
Write-Host "Ahora: Dashboard (rule.id:100322), en el NAS 'sudo iptables -L -n' y 'sudo tail /var/ossec/logs/active-responses.log'"
# Limpieza (cuando expire el bloqueo): Get-ChildItem $Share -Filter *.c04x | Rename-Item -NewName { $_.Name -replace '\.c04x$','' }

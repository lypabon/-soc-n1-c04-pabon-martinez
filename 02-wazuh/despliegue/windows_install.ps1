# Agente Wazuh en win11-c04-lp (PowerShell como administrador).
# Preferir el comando exacto que genera el Dashboard (Agents > Deploy new agent) para la versión instalada.
$Version = "4.14.X"   # <-- poner la versión EXACTA del manager
$Msi = "$env:TEMP\wazuh-agent.msi"
Invoke-WebRequest -Uri "https://packages.wazuh.com/4.x/windows/wazuh-agent-$Version-1.msi" -OutFile $Msi
msiexec.exe /i $Msi /q WAZUH_MANAGER='192.168.56.10' WAZUH_AGENT_GROUP='windows-estaciones' WAZUH_AGENT_NAME="$env:COMPUTERNAME"
Start-Sleep 10
NET START WazuhSvc
# Carpeta de trabajo vigilada por FIM
New-Item -ItemType Directory -Force -Path C:\Proyectos | Out-Null

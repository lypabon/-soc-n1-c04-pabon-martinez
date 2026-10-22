# GLPI Agent (inventario) — verificar parámetros vigentes del instalador

Windows (PowerShell admin):
```
msiexec /i GLPI-Agent-<VERSION>-x64.msi /quiet SERVER="https://soporte.lumbredigital.example/front/inventory.php" RUNNOW=1 ADD_FIREWALL_EXCEPTION=1
```
Linux (nas-c04-lp):
```
sudo perl glpi-agent-<VERSION>-linux-installer.pl --server="https://soporte.lumbredigital.example/front/inventory.php" --install --runnow
```
Registrar a mano: FW-C04-01 (NGFW), SW-C04-01, AP-C04-01/02, Google Workspace (servicio), licencia Kaspersky
(con vencimiento), contratos: ISP, proveedor N2, Google Workspace. Estados: En uso, En laboratorio, En reparación, Retirado.
Los 20 equipos reales: GLPI Agent distribuido con la tarea remota de Kaspersky (Windows) y manual en Mac/NAS.

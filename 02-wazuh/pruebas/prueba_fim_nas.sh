#!/usr/bin/env bash
# En nas-c04-lp. Genera eventos FIM INOFENSIVOS en la carpeta vigilada.
# Esperado: 554/550/553, 100300 (x6), 100303 (5 en 2 min), 100301 (nota), 100302 (borrado masivo).
# Verificado en Wazuh 4.14.9: 100300, 100301, 100302 y 100303 dispararon.
set -e
D=/srv/proyectos/prueba_fim_lp
sudo mkdir -p $D
echo "1) Alta/modificación/borrado simple"
echo "v1" | sudo tee $D/prueba_fim_lp.txt >/dev/null; sleep 3
echo "v2" | sudo tee -a $D/prueba_fim_lp.txt >/dev/null; sleep 3
sudo rm $D/prueba_fim_lp.txt; sleep 3
echo "2) Archivos con extensión de cifrado + nota de rescate (simulación, contenido sin valor)"
for i in 1 2 3 4 5 6; do echo "falso" | sudo tee $D/pieza_$i.psd.locked >/dev/null; sleep 1; done
echo "esto es una prueba de laboratorio" | sudo tee $D/README_DECRYPT.txt >/dev/null
echo "3) Borrado masivo (35 archivos)"
sudo mkdir -p $D/borrar; for i in $(seq 1 35); do echo x | sudo tee $D/borrar/f$i.txt >/dev/null; done
sleep 8; sudo rm -f $D/borrar/*
echo "Revise el Dashboard: rule.id:(100300 OR 100301 OR 100302 OR 100303)"

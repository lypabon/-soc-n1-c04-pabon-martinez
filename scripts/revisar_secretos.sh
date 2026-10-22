#!/usr/bin/env bash
# Busca posibles secretos antes de hacer commit. Revisar a mano cada coincidencia.
cd "$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
echo "== Posibles contraseñas, llaves o tokens =="
grep -RInE "(password|passwd|contraseña|secret|token|api[_-]?key)\s*[:=]\s*['\"]?[^'\"[:space:]<]{6,}" \
  --exclude-dir=.git . | grep -v "CAMBIAR_CLAVE" || echo "OK: nada sospechoso"
echo "== Llaves privadas =="
grep -RIl "BEGIN .*PRIVATE KEY" --exclude-dir=.git --exclude=revisar_secretos.sh . || echo "OK"
echo "== IPv4 que no son privadas ni de documentación =="
grep -RIoE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" --exclude-dir=.git . | \
  grep -vE ":(10\.|192\.168\.|127\.|0\.0\.0\.0|192\.0\.2\.|198\.51\.100\.|203\.0\.113\.|255\.)" || echo "OK"

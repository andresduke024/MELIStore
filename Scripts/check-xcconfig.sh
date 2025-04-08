#!/bin/bash
set -e

echo "🔍 Verificando si hay archivos .xcconfig en el staging..."

if git diff --cached --name-only | grep -q "\.xcconfig$"; then
  echo "❌ Error: No se permite comitear archivos .xcconfig"
  exit 1
fi

echo "✅ No se encontraron archivos .xcconfig en el staging."
exit 0


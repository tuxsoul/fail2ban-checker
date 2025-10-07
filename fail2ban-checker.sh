#!/bin/bash

# fail2ban-checker.sh
# Sincroniza direcciones entre Fail2ban y Shorewall
# Copyright (C) 2025 Mario Oyorzabal Salgado <tuxsoul@tuxsoul.com>
# Este script está bajo la licencia GNU GPLv3
# Para más detalles, revisa el archivo LICENSE en este repositorio

set -e

# Verificar que fail2ban-client existe
if ! command -v fail2ban-client >/dev/null 2>&1; then
    exit 1
fi

# Verificar que shorewall existe
if ! command -v shorewall >/dev/null 2>&1; then
    exit 1
fi

# Obtener direcciones de Fail2Ban
FAIL2BAN=$(fail2ban-client banned | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | sort -u)

# Obtener direcciones de Shorewall
SHOREWALL=$(shorewall show bl | grep -Eo '\s{2,}[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+\s{2,}' | tr -d ' ' | sort -u)

# Inicializar resultados
ONLY_FAIL2BAN=""
ONLY_SHOREWALL=""

# Comparar IPs solo en Fail2Ban
while IFS= read -r ip; do
    echo "$SHOREWALL" | grep -qx "$ip" || ONLY_FAIL2BAN="${ONLY_FAIL2BAN}${ip}\n"
done <<EOF
$FAIL2BAN
EOF

# Comparar IPs solo en Shorewall
while IFS= read -r ip; do
    echo "$FAIL2BAN" | grep -qx "$ip" || ONLY_SHOREWALL="${ONLY_SHOREWALL}${ip}\n"
done <<EOF
$SHOREWALL
EOF

# Elimina direcciones de Shorewall
printf "$ONLY_SHOREWALL" | while IFS= read -r ip; do
    [ -n "$ip" ] && shorewall allow "$ip" >/dev/null 2>&1
done

# Agrega direcciones a Shorewall
printf "$ONLY_FAIL2BAN" | while IFS= read -r ip; do
    [ -n "$ip" ] && shorewall reject "$ip" >/dev/null 2>&1
done

exit 0

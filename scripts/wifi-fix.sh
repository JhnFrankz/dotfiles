#!/usr/bin/env bash
# ==============================================================================
# Script: wifi-fix.sh
# Description: Optimiza la estabilidad y rendimiento del chipset Realtek RTL8852BE
#              desactivando la suspensión agresiva PCIe (ASPM) y el ahorro de
#              energía de Wi-Fi en NetworkManager.
# ==============================================================================
set -euo pipefail

if [ "$EUID" -ne 0 ]; then
    echo "Por favor, ejecuta este script con privilegios root (sudo):"
    echo "  sudo $0"
    exit 1
fi

echo "==> Configurando opciones de driver para Realtek RTL8852BE (rtw89)..."
mkdir -p /etc/modprobe.d
cat << 'EOF' > /etc/modprobe.d/rtw89.conf
# Desactivar suspensión agresiva PCIe (ASPM L1/L1ss) y modo bajo consumo
options rtw89_pci disable_aspm_l1=y disable_aspm_l1ss=y disable_clkreq=y
options rtw89_core disable_ps_mode=y
EOF

echo "==> Desactivando ahorro de energía Wi-Fi en NetworkManager..."
mkdir -p /etc/NetworkManager/conf.d
cat << 'EOF' > /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf
[connection]
wifi.powersave = 2
EOF

echo "==> Reiniciando servicio de NetworkManager..."
systemctl restart NetworkManager

echo "✔ Ajustes aplicados con éxito."
echo "Para aplicar completamente los módulos de kernel de Realtek, reinicia el sistema (reboot)."

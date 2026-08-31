#!/usr/bin/env bash
# ==============================================================================
# Script: kde-settings.sh
# Descripción: Aplica ajustes reales configurados en KDE Plasma 6
# ==============================================================================

set -euo pipefail

echo "==> Aplicando configuraciones de KDE Plasma 6..."

# 1. Teclado: Activar NumLock al inicio de sesión (0 = Activar)
echo "  -> Configurando Bloq Num (NumLock) activado al inicio..."
kwriteconfig6 --file kcminputrc --group Keyboard --key NumLock 0

# 2. Pantalla: Luz Nocturna (Night Light) siempre activa a 4200K
echo "  -> Configurando Luz Nocturna (Night Light) permanente..."
kwriteconfig6 --file kwinrc --group NightColor --key Active true
kwriteconfig6 --file kwinrc --group NightColor --key Mode Constant
kwriteconfig6 --file kwinrc --group NightColor --key NightTemperature 4200

# 3. Ratón: Desactivar aceleración (Perfil plano 1:1) para Logitech G502 HERO
echo "  -> Desactivando aceleración del ratón (Perfil plano)..."
kwriteconfig6 --file kcminputrc --group Libinput --group 1133 --group 49291 --group "Logitech G502 HERO Gaming Mouse" --key PointerAccelerationProfile 1
kwriteconfig6 --file kcminputrc --group Libinput --group 1133 --group 49291 --group "Logitech G502 HERO Gaming Mouse" --key PointerAcceleration -- "-0.200"

# 4. Terminal: Establecer Alacritty como terminal predeterminada en KDE
echo "  -> Estableciendo Alacritty como terminal predeterminada..."
kwriteconfig6 --file kdeglobals --group General --key TerminalApplication alacritty
kwriteconfig6 --file kdeglobals --group General --key TerminalService Alacritty.desktop

# 5. Atajo de teclado: Ctrl+Alt+T para abrir Alacritty
echo "  -> Asignando atajo Ctrl+Alt+T para Alacritty..."
kwriteconfig6 --file kglobalshortcutsrc --group services --group Alacritty.desktop --key _launch Ctrl+Alt+T
kwriteconfig6 --file kglobalshortcutsrc --group services --group org.kde.konsole.desktop --key _launch none

# 6. Capturas de pantalla: Copiar directo al portapapeles al soltar selección
echo "  -> Configurando Spectacle para copiar directo al portapapeles..."
kwriteconfig6 --file spectaclerc --group General --key autoSaveImage false
kwriteconfig6 --file spectaclerc --group General --key clipboardGroup PostScreenshotCopyImage
kwriteconfig6 --file spectaclerc --group General --key useReleaseToCapture true

echo "✔ Todos los ajustes de KDE Plasma aplicados correctamente."

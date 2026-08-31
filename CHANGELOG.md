# 📝 Bitácora de Cambios del Sistema

Historial de ajustes, configuraciones y personalizaciones aplicadas al sistema operativo, junto con las instrucciones para revertirlas.

---

## 📅 2026-08-31

### 🎨 Personalización de Terminal: Alacritty (Tema Tokyo Night)
* **Categoría:** Terminal / Apariencia (Alacritty)
* **Archivo afectado:** `~/.config/alacritty/alacritty.toml`
* **Cambios aplicados:**
  1. **Esquema de colores:** Se aplicó la paleta oficial **Tokyo Night** (fondo `#1a1b26`, acentos azul, magenta y cian).
  2. **Márgenes internos (*Padding*):** Se agregó `padding = { x = 12, y = 12 }` para separar el texto de los bordes.
  3. **Cursor:** Cambiado a barra vertical parpadeante (`shape = "Beam"`, `blinking = "On"`).
  4. **Opacidad:** Ajustada al 85% (`opacity = 0.85`).

#### ⏪ Instrucciones de reversión (Volver al tema Nord por defecto):
```toml
# En ~/.config/alacritty/alacritty.toml cambiar [colors.primary]:
# background = "0x2E3440"
# foreground = "0xD8DEE9"
```

---

### ⌨️ Atajo de Teclado Global: `Ctrl + Alt + T` para Alacritty
* **Categoría:** Atajos de Teclado (KDE Plasma 6 / KGlobalAccel)
* **Archivo afectado:** `~/.config/kglobalshortcutsrc`
* **Cambio:** Se asignó `Ctrl+Alt+T` a `[services][Alacritty.desktop]` para abrir la terminal por defecto inmediatamente.

#### ⏪ Instrucciones de reversión:
```bash
kwriteconfig6 --file kglobalshortcutsrc --group services --group Alacritty.desktop --key _launch "none,none,Alacritty"
kwriteconfig6 --file kglobalshortcutsrc --group services --group org.kde.konsole.desktop --key _launch "Ctrl+Alt+T,none,Konsole"
```

---

### 🖥️ Terminal Predeterminada: Alacritty
* **Categoría:** Aplicaciones Predeterminadas (KDE Plasma 6)
* **Archivo afectado:** `~/.config/kdeglobals`
* **Cambio:** Se configuró `TerminalApplication=alacritty` y `TerminalService=Alacritty.desktop` dentro de `[General]` para que el sistema abra Alacritty por defecto.

#### ⏪ Instrucciones de reversión (Restaurar Konsole por defecto):
```bash
kwriteconfig6 --file kdeglobals --group General --key TerminalApplication --delete
kwriteconfig6 --file kdeglobals --group General --key TerminalService --delete
```

---

## 📅 2026-08-30

### ⌨️ Teclado Numérico (NumLock) al Iniciar Sesión y Pantalla de Bloqueo
* **Categoría:** Entorno de Escritorio / Gestor de Inicio (KDE Plasma 6 / Plasma Login)
* **Archivos afectados:** `~/.config/kcminputrc` y configuración sincronizada de inicio de sesión.
* **Cambio:**
  1. Se configuró `NumLock=0` en `[Keyboard]` para activar el teclado numérico en la sesión de usuario.
  2. Se sincronizó la configuración mediante **Apply Plasma Settings...** en la pantalla de inicio de sesión (*Login Screen*).

#### ⏪ Instrucciones de reversión:
```bash
kwriteconfig6 --file kcminputrc --group Keyboard --key NumLock 1
```

---

### 🌙 Luz Nocturna (Night Light) Siempre Activa
* **Categoría:** Pantalla / Color (KDE Plasma 6 / KWin)
* **Archivo afectado:** `~/.config/kwinrc`
* **Cambio:** Se configuró `[NightColor]` con `Active=true`, `Mode=Constant` y `NightTemperature=4200`.

#### ⏪ Instrucciones de reversión:
```bash
kwriteconfig6 --file kwinrc --group NightColor --key Active false
```

---

### 🖱️ Desactivación de Aceleración del Ratón (Perfil Plano 1:1)
* **Categoría:** Dispositivos de Entrada (Libinput / KDE Plasma 6)
* **Archivo afectado:** `~/.config/kcminputrc`
* **Cambio:** Se configuró `PointerAccelerationProfile=1` (perfil plano) y `PointerAcceleration=-0.200` para *Logitech G502 HERO*.

#### ⏪ Instrucciones de reversión:
```bash
kwriteconfig6 --file kcminputrc --group Libinput --group 1133 --group 49291 --group "Logitech G502 HERO Gaming Mouse" --key PointerAccelerationProfile 0
```

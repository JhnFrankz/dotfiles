# 📝 Bitácora de Cambios del Sistema

Historial de ajustes, configuraciones y personalizaciones aplicadas al sistema operativo, junto con las instrucciones para revertirlas.

---

## 📅 2026-08-31

### 📸 Capturas de Pantalla: Copiado Directo al Portapapeles (Spectacle)
* **Categoría:** Utilidades / Capturas (Spectacle / KDE Plasma 6)
* **Archivo afectado:** `~/.config/spectaclerc`
* **Cambios aplicados:**
  1. `clipboardGroup=PostScreenshotCopyImage`: Copia automáticamente la imagen al portapapeles tras realizar la captura.
  2. `autoSaveImage=false`: Evita guardar archivos `.png` no deseados en el disco.
  3. `useReleaseToCapture=true`: Finaliza la captura inmediatamente al soltar el clic del ratón (igual que Windows Snipping Tool con `Super + Shift + S`).

#### ⏪ Instrucciones de reversión:
```bash
kwriteconfig6 --file spectaclerc --group General --key clipboardGroup PostScreenshotDoNothing
kwriteconfig6 --file spectaclerc --group General --key useReleaseToCapture false
```
*(GUI: Abrir Spectacle → Configuración → Guardado y Portapapeles).*

---

### 🎨 Personalización de Terminal: Alacritty (Tema Dracula)
* **Categoría:** Terminal / Apariencia (Alacritty)
* **Archivo afectado:** `~/.config/alacritty/alacritty.toml`
* **Cambios aplicados:**
  1. **Esquema de colores:** Paleta oficial **Dracula**.
  2. **Márgenes internos (*Padding*):** `padding = { x = 12, y = 12 }`.
  3. **Cursor:** Barra vertical parpadeante (`shape = "Beam"`, `blinking = "On"`).
  4. **Opacidad:** 85% (`opacity = 0.85`).

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
* **Cambio:** Se configuró `TerminalApplication=alacritty` y `TerminalService=Alacritty.desktop` dentro de `[General]`.

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

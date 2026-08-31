# 📝 Bitácora de Cambios del Sistema

Historial de ajustes, configuraciones y personalizaciones aplicadas al sistema operativo, junto con las instrucciones para revertirlas.

---

## 📅 2026-08-31

### ⌨️ Atajo de Teclado Global: `Ctrl + Alt + T` para Alacritty
* **Categoría:** Atajos de Teclado (KDE Plasma 6 / KGlobalAccel)
* **Archivo afectado:** `~/.config/kglobalshortcutsrc`
* **Cambio:** Se asignó `Ctrl+Alt+T` a `[services][Alacritty.desktop]` y se removió de Konsole para abrir la terminal por defecto inmediatamente.

#### ⏪ Instrucciones de reversión:
```bash
# Para reasignar Ctrl+Alt+T a Konsole o quitarlo:
kwriteconfig6 --file kglobalshortcutsrc --group services --group Alacritty.desktop --key _launch "none,none,Alacritty"
kwriteconfig6 --file kglobalshortcutsrc --group services --group org.kde.konsole.desktop --key _launch "Ctrl+Alt+T,none,Konsole"
```
*(GUI: Preferencias del Sistema → Atajos → Alacritty).*

---

### 🖥️ Terminal Predeterminada: Alacritty
* **Categoría:** Aplicaciones Predeterminadas (KDE Plasma 6)
* **Archivo afectado:** `~/.config/kdeglobals`
* **Cambio:** Se configuró `TerminalApplication=alacritty` y `TerminalService=Alacritty.desktop` dentro de `[General]` para que el sistema abra Alacritty por defecto (atajos, Dolphin, scripts).

#### ⏪ Instrucciones de reversión (Restaurar Konsole por defecto):
```bash
kwriteconfig6 --file kdeglobals --group General --key TerminalApplication --delete
kwriteconfig6 --file kdeglobals --group General --key TerminalService --delete
```
*(GUI: Preferencias del Sistema → Aplicaciones predeterminadas → Emulador de terminal → Konsole).*

---

## 📅 2026-08-30

### ⌨️ Teclado Numérico (NumLock) al Iniciar Sesión y Pantalla de Bloqueo
* **Categoría:** Entorno de Escritorio / Gestor de Inicio (KDE Plasma 6 / Plasma Login)
* **Archivos afectados:** `~/.config/kcminputrc` y configuración sincronizada de inicio de sesión.
* **Cambio:**
  1. Se configuró `NumLock=0` en `[Keyboard]` para activar el teclado numérico en la sesión de usuario.
  2. Se sincronizó la configuración mediante **Apply Plasma Settings...** en la pantalla de inicio de sesión (*Login Screen*) para que el Bloq Num esté encendido desde la pantalla de contraseña antes del login.

#### ⏪ Instrucciones de reversión:
```bash
# Para restaurar al estado desactivado:
kwriteconfig6 --file kcminputrc --group Keyboard --key NumLock 1
```
*(GUI: Preferencias del Sistema → Dispositivos de entrada → Teclado → Bloq Num al inicio de Plasma).*

---

### 🌙 Luz Nocturna (Night Light) Siempre Activa
* **Categoría:** Pantalla / Color (KDE Plasma 6 / KWin)
* **Archivo afectado:** `~/.config/kwinrc`
* **Cambio:** Se configuró `[NightColor]` con `Active=true`, `Mode=Constant` y `NightTemperature=4200` para mantener el filtro de luz cálida permanentemente activo.

#### ⏪ Instrucciones de reversión:
```bash
# Para desactivar la luz nocturna:
kwriteconfig6 --file kwinrc --group NightColor --key Active false

# O para volver al modo automático (activación por atardecer/ubicación):
kwriteconfig6 --file kwinrc --group NightColor --key Mode Location
```
*(GUI: Preferencias del Sistema → Pantalla y Monitor → Luz nocturna).*

---

### 🖱️ Desactivación de Aceleración del Ratón (Perfil Plano 1:1)
* **Categoría:** Dispositivos de Entrada (Libinput / KDE Plasma 6)
* **Archivo afectado:** `~/.config/kcminputrc`
* **Cambio:** Se configuró `PointerAccelerationProfile=1` (perfil plano) y sensibilidad `PointerAcceleration=-0.200` para el ratón *Logitech G502 HERO Gaming Mouse*, garantizando respuesta 1:1 sin aceleración dinámica.

#### ⏪ Instrucciones de reversión:
```bash
# Para volver al perfil adaptativo (aceleración por defecto):
kwriteconfig6 --file kcminputrc --group Libinput --group 1133 --group 49291 --group "Logitech G502 HERO Gaming Mouse" --key PointerAccelerationProfile 0
```
*(GUI: Preferencias del Sistema → Dispositivos de entrada → Ratón → Aceleración del puntero).*

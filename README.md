# 💻 Dotfiles & Configuración del Sistema (CachyOS)

Repositorio personal de configuración, dotfiles y registro de personalización del sistema operativo.

---

## 🖥️ Especificaciones del Sistema

| Componente | Detalle |
| :--- | :--- |
| **Sistema Operativo** | [CachyOS Linux](https://cachyos.org/) (Arch-based, rolling release, repos x86-64-v3) |
| **Kernel** | `linux-cachyos` (7.2.x) |
| **Entorno de Escritorio** | KDE Plasma 6 (Wayland) |
| **Shell Principal** | Fish Shell (`/bin/fish`) con `fnm` y `pnpm` |
| **Procesador (CPU)** | Intel Core 12th Gen (Alder Lake-S) |
| **Gráficos (GPU)** | Gráficos Híbridos: Intel UHD Graphics + NVIDIA GeForce RTX 3050 6GB Laptop GPU |
| **Memoria RAM** | 16 GB RAM + 15 GB zram swap |
| **Almacenamiento** | SSD NVMe 256 GB (Btrfs con subvolúmenes `@`, `@home`, `@var`, etc.) |
| **Dual Boot** | Windows 11 SSD (NVMe secundario) + CachyOS |
| **Bootloader** | Limine Bootloader |

---

## 📦 Gestores de Paquetes y Herramientas Base

- **Pacman** (optimizado con repositorios `cachyos-v3` y descargas paralelas)
- **Paru** (AUR Helper)
- **fnm** (Fast Node Manager) + **pnpm**
- **Snapper** (Gestión de snapshots Btrfs en root `/`)
- **Btrfs Assistant** (GUI para snapshots y subvolúmenes)

---

## 🔐 Seguridad y Claves

- **SSH:** Clave `ed25519` configurada para GitHub (`~/.ssh/config`).
- **GPG:** Firma de commits activada en Git (`commit.gpgsign = true`).
- **Git Config:** Configuración global con email y firma vinculada.

---

## 📋 Lista de Tareas / Checklist de Configuración

### 1. Sistema & Seguridad
- [x] Instalación de `paru` (AUR Helper).
- [ ] Configuración y activación de firewall (`ufw`).
- [ ] Habilitar temporizadores de mantenimiento de Btrfs (`btrfs-scrub@-.timer`, `btrfs-scrub@home.timer`).
- [ ] Sincronización de reloj RTC para Dual Boot (Windows `RealTimeIsUniversal`).

### 2. Entorno de Desarrollo y Terminal
- [x] Instalación de `ripgrep` (búsqueda ultrarrápida de texto en proyectos).
- [x] Instalación de `uv` (gestor moderno y ultrarrápido de Python).
- [x] Configuración de aliases útiles (`gs`, `ga`, `gc`, `gp`, `gl`, `gd`) en `~/.config/fish/config.fish`.
- [ ] Herramientas CLI opcionales (`zoxide`, `starship`).
- [ ] Soporte para Docker / Contenedores (`docker`, `docker-compose`).

### 3. Rendimiento & Multimedia
- [ ] Controladores de aceleración por hardware de video Intel (`intel-media-driver`, `libva-utils`).
- [ ] Perfiles de energía y GPU híbrida (`prime-run`).

### 4. Dotfiles & Modularización
- [ ] Organización de configuraciones con **GNU Stow**.
- [ ] Versionar configuración de Fish, Git, Alacritty y Code - OSS.

---

## 📂 Estructura del Repositorio

```text
.
├── README.md                # Documentación y bitácora del sistema
├── CHANGELOG.md             # Historial de cambios y guía de reversión
├── .gitignore               # Filtro de archivos no deseados / sensibles
├── scripts/                 # Scripts modulares (solo cambios reales aplicados)
│   └── kde-settings.sh      # Ajustes de KDE Plasma 6 (NumLock al inicio)
└── dotfiles/                # Configuraciones modulares listas para symlink / stow
    ├── fish/                # ~/.config/fish/
    ├── alacritty/           # ~/.config/alacritty/
    ├── git/                 # ~/.gitconfig
    └── code/                # Configuración de VS Code / Code OSS
```

---

## 🚀 Guía Rápida de Comandos Útiles

```bash
# Actualizar el sistema y paquetes de AUR
paru

# Limpieza de caché de paquetes huérfanos
paru -Sc

# Ejecutar una aplicación con la GPU dedicada NVIDIA
prime-run <comando>

# Ver estado de snapshots de Snapper
sudo snapper -c root list
```

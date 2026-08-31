# 💻 Dotfiles (CachyOS + KDE Plasma 6)

Mi configuración personal de entorno de desarrollo y ajustes del sistema para Linux.

---

## 🛠️ Stack & Herramientas

| Componente | Elección |
| :--- | :--- |
| **Distribución** | [CachyOS](https://cachyos.org/) (Arch Linux x86-64-v3) |
| **Escritorio** | KDE Plasma 6 (Wayland) |
| **Terminal** | [Alacritty](https://alacritty.org/) (`Ctrl + Alt + T`) |
| **Shell** | [Fish Shell](https://fishshell.com/) + `fnm` + `pnpm` |
| **Herramientas CLI** | `git` (GPG signed), `gh`, `ripgrep`, `fzf`, `jq` |

---

## 🚀 Instalación y Uso

Clonar el repositorio y aplicar los ajustes del sistema:

```bash
git clone https://github.com/JhnFrankz/dotfiles.git ~/Projects/dotfiles
cd ~/Projects/dotfiles

# Aplicar ajustes de escritorio (NumLock, Alacritty, KWin)
./scripts/kde-settings.sh
```

---

## 📂 Estructura

```text
.
├── scripts/
│   └── kde-settings.sh   # Ajustes automatizados de KDE Plasma 6
├── dotfiles/             # Configuraciones modulares para symlink (Stow)
│   ├── fish/             # ~/.config/fish/
│   └── alacritty/        # ~/.config/alacritty/
├── CHANGELOG.md          # Bitácora de cambios y guía de reversión
└── README.md             # Documentación principal
```

---

## 📝 Bitácora
Todos los ajustes aplicados al sistema cuentan con instrucciones de reversión en [CHANGELOG.md](CHANGELOG.md).

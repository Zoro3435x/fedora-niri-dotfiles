<div align="center">

# 🌸 fedora-niri-dotfiles

**Niri · Waybar · Eww · Kitty · Catppuccin Mocha**

![Fedora](https://img.shields.io/badge/Fedora-Linux-51A2DA?style=flat-square&logo=fedora&logoColor=white)
![Wayland](https://img.shields.io/badge/Wayland-Session-FFBC00?style=flat-square&logo=wayland&logoColor=black)
![Niri](https://img.shields.io/badge/Compositor-Niri-cba6f7?style=flat-square)
![Catppuccin](https://img.shields.io/badge/Theme-Catppuccin%20Mocha-1e1e2e?style=flat-square)

</div>

---

## 🧩 Stack

| Componente          | Herramienta             |
| ------------------- | ----------------------- |
| Sistema             | Fedora Linux            |
| Sesión              | Wayland                 |
| Compositor          | Niri                    |
| Terminal            | Kitty                   |
| Barra superior      | Waybar                  |
| Dock inferior       | Waybar                  |
| Panel rápido        | Eww                     |
| Launcher            | Fuzzel                  |
| Wallpaper           | Swaybg                  |
| Notificaciones      | Mako                    |
| Lock screen         | Swaylock                |
| Menú de apagado     | Wlogout                 |
| Editor              | Neovim + LazyVim        |
| Prompt              | Starship                |
| Portapapeles        | Cliphist                |
| Monitor del sistema | Btop                    |
| Música              | Spotify + Playerctl     |
| Tema                | Catppuccin Mocha        |
| Fuente              | JetBrainsMono Nerd Font |

---

## 🎨 Paleta — Catppuccin Mocha

| Nombre  | Hex       | Vista |
| ------- | --------- | ----- |
| Base    | `#1e1e2e` | ![](https://img.shields.io/badge/%20-%20-1e1e2e?style=flat-square) |
| Mantle  | `#181825` | ![](https://img.shields.io/badge/%20-%20-181825?style=flat-square) |
| Crust   | `#11111b` | ![](https://img.shields.io/badge/%20-%20-11111b?style=flat-square) |
| Surface | `#313244` | ![](https://img.shields.io/badge/%20-%20-313244?style=flat-square) |
| Text    | `#cdd6f4` | ![](https://img.shields.io/badge/%20-%20-cdd6f4?style=flat-square) |
| Subtext | `#a6adc8` | ![](https://img.shields.io/badge/%20-%20-a6adc8?style=flat-square) |
| Mauve   | `#cba6f7` | ![](https://img.shields.io/badge/%20-%20-cba6f7?style=flat-square) |
| Blue    | `#89b4fa` | ![](https://img.shields.io/badge/%20-%20-89b4fa?style=flat-square) |
| Green   | `#a6e3a1` | ![](https://img.shields.io/badge/%20-%20-a6e3a1?style=flat-square) |
| Yellow  | `#f9e2af` | ![](https://img.shields.io/badge/%20-%20-f9e2af?style=flat-square) |
| Red     | `#f38ba8` | ![](https://img.shields.io/badge/%20-%20-f38ba8?style=flat-square) |

---

## 📦 Instalación

### 1. Dependencias principales

```bash
sudo dnf install \
  niri waybar kitty fuzzel swaybg mako swaylock wlogout \
  cliphist wl-clipboard btop zoxide fastfetch playerctl \
  pavucontrol yad jq git curl unzip tar neovim
```

### 2. Dependencias adicionales

```bash
# GitHub CLI
sudo dnf install gh

# Eww
sudo dnf copr enable varlad/eww
sudo dnf install eww

# SwayOSD
sudo dnf copr enable markupstart/SwayOSD
sudo dnf install swayosd

# Spotify
flatpak install flathub com.spotify.Client
```

### 3. Fuentes

Instalar **JetBrainsMono Nerd Font** en el directorio recomendado:

```bash
mkdir -p ~/.local/share/fonts
# Coloca los archivos .ttf aquí y luego actualiza el cache:
fc-cache -fv
```

---

## 🚀 Instalación manual

**Clonar el repositorio:**

```bash
git clone git@github.com:Zoro3435x/fedora-niri-dotfiles.git ~/dotfiles
```

**Respaldar configuración actual:**

```bash
mkdir -p ~/.config/backup-dotfiles

for dir in niri waybar kitty fuzzel mako wlogout eww fastfetch nvim; do
  [ -e "$HOME/.config/$dir" ] && mv "$HOME/.config/$dir" "$HOME/.config/backup-dotfiles/$dir"
done

[ -e "$HOME/.config/starship.toml" ] && mv "$HOME/.config/starship.toml" "$HOME/.config/backup-dotfiles/starship.toml"
```

**Copiar configuración:**

```bash
cp -r ~/dotfiles/config/niri ~/.config/
cp -r ~/dotfiles/config/waybar ~/.config/
cp -r ~/dotfiles/config/kitty ~/.config/
cp -r ~/dotfiles/config/fuzzel ~/.config/
cp -r ~/dotfiles/config/mako ~/.config/
cp -r ~/dotfiles/config/wlogout ~/.config/
cp -r ~/dotfiles/config/eww ~/.config/
cp -r ~/dotfiles/config/fastfetch ~/.config/
cp -r ~/dotfiles/config/nvim ~/.config/
cp ~/dotfiles/config/starship.toml ~/.config/starship.toml
```

**Dar permisos a scripts:**

```bash
chmod +x ~/.config/niri/scripts/*.sh
chmod +x ~/.config/waybar/scripts/*.sh
chmod +x ~/.config/eww/scripts/*.sh
```

**Validar configuración de Niri:**

```bash
niri validate
```

---

## 📁 Estructura del repositorio

```
dotfiles/
├── config/
│   ├── niri/
│   ├── waybar/
│   ├── kitty/
│   ├── fuzzel/
│   ├── mako/
│   ├── wlogout/
│   ├── eww/
│   ├── fastfetch/
│   ├── nvim/
│   └── starship.toml
├── update-dotfiles.sh
└── README.md
```

---

## ⌨️ Atajos principales

| Atajo                | Acción                        |
| -------------------- | ----------------------------- |
| `Super + Enter`      | Abrir Kitty                   |
| `Super + D`          | Abrir Fuzzel                  |
| `Super + A`          | App menu por categorías       |
| `Super + Shift + Q`  | Quick panel Eww               |
| `Super + Shift + W`  | Wallpaper switcher            |
| `Super + Escape`     | Bloquear pantalla             |
| `Super + Shift + E`  | Wlogout                       |
| `Super + Alt + V`    | Historial de portapapeles     |
| `Super + B`          | Btop                          |
| `Super + O`          | Overview de Niri              |

---

## 🔧 Scripts importantes

| Script | Descripción |
| ------ | ----------- |
| `~/.config/niri/scripts/start-waybar.sh` | Lanza Waybar superior, dock inferior y panel Eww |
| `~/.config/eww/scripts/toggle-panel.sh` | Abre/cierra el panel rápido |
| `~/.config/niri/scripts/wallpaper-switcher.sh` | Cambia el fondo de pantalla con Fuzzel |
| `~/.config/niri/scripts/app-menu.sh` | Launcher por categorías |
| `~/.config/niri/scripts/focus-or-open.sh` | Enfoca una app si está abierta, o la lanza |

---

## ✨ Características

### 🔵 Waybar superior
Barra translúcida con: workspaces · ventana activa · música · reloj · CPU · RAM · red · audio · power

### 🟣 Dock inferior
Dock con Waybar para abrir o enfocar: Archivos · Firefox · Kitty · Neovim · Fuzzel · Steam · Spotify · Btop · Power

### 🟡 Panel Eww
Centro de control con: WiFi · Audio · Steam · Lock · CPU · RAM · Temperatura · Spotify / Now Playing · Slider de volumen · Btop · Clipboard · Power

### 🖼️ Wallpaper switcher
Cambia fondos desde `~/Pictures/Wallpapers` usando Fuzzel. El wallpaper activo se guarda en `~/.config/niri/wallpaper.jpg`.

### 🗂️ App menu por categorías
Launcher personalizado con Fuzzel organizado en: Desarrollo · Internet · Juegos · Archivos · Sistema · Multimedia

### 🎯 Dock inteligente
Scripts que enfocan la app si ya está abierta, o la lanzan si no existe.

App IDs configurados:

| App     | ID                      |
| ------- | ----------------------- |
| Firefox | `org.mozilla.firefox`   |
| Kitty   | `kitty`                 |
| Steam   | `steam`                 |
| Spotify | `spotify`               |

---

## 🖥️ Notas sobre monitores

Configuración pensada para:

| Puerto    | Monitor           | Resolución      |
| --------- | ----------------- | --------------- |
| HDMI-A-1  | AOC               | 1920×1080       |
| HDMI-A-2  | Dell              | 3840×2160 @ 1.5x scale |

El panel Eww está fijado a `HDMI-A-1`. Si usas otro monitor, edita `~/.config/eww/eww.yuck` y cambia:

```lisp
:monitor 1
```

---

<div align="center">

Hecho con 🖤 y Catppuccin Mocha

</div>

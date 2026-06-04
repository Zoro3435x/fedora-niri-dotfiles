# Fedora Niri Dotfiles

Configuración personal para Fedora Linux usando Wayland, Niri, Waybar, Eww, Kitty y Neovim.  
El objetivo de este setup es tener un entorno minimalista, rápido, estético y orientado al teclado para desarrollo de software.

## Preview

> Agrega aquí tus capturas del escritorio.

```text
Niri + Waybar + Eww + Kitty + Catppuccin Mocha

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

Paleta
Base:       #1e1e2e
Mantle:     #181825
Crust:      #11111b
Surface:    #313244
Text:       #cdd6f4
Subtext:    #a6adc8
Mauve:      #cba6f7
Blue:       #89b4fa
Green:      #a6e3a1
Yellow:     #f9e2af
Red:        #f38ba8

Dependencias principales
sudo dnf install \
  niri \
  waybar \
  kitty \
  fuzzel \
  swaybg \
  mako \
  swaylock \
  wlogout \
  cliphist \
  wl-clipboard \
  btop \
  zoxide \
  fastfetch \
  playerctl \
  pavucontrol \
  yad \
  jq \
  git \
  curl \
  unzip \
  tar \
  neovim

Dependencias adicionales
sudo dnf install gh
sudo dnf copr enable varlad/eww
sudo dnf install eww
sudo dnf copr enable markupstart/SwayOSD
sudo dnf install swayosd
flatpak install flathub com.spotify.Client

Fuentes
Instalar JetBrainsMono Nerd Font.
Directorio recomendado:
mkdir -p ~/.local/share/fonts
Después de instalar la fuente:
fc-cache -fv

Estructura del repo
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

Instalación manual

Clonar el repositorio:

git clone git@github.com:Zoro3435x/fedora-niri-dotfiles.git ~/dotfiles

Crear respaldo de configuración actual:

mkdir -p ~/.config/backup-dotfiles

for dir in niri waybar kitty fuzzel mako wlogout eww fastfetch nvim; do
  [ -e "$HOME/.config/$dir" ] && mv "$HOME/.config/$dir" "$HOME/.config/backup-dotfiles/$dir"
done

[ -e "$HOME/.config/starship.toml" ] && mv "$HOME/.config/starship.toml" "$HOME/.config/backup-dotfiles/starship.toml"

Copiar configuración:

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

Dar permisos a scripts:

chmod +x ~/.config/niri/scripts/*.sh
chmod +x ~/.config/waybar/scripts/*.sh
chmod +x ~/.config/eww/scripts/*.sh

Validar Niri:

niri validate
Scripts importantes
Iniciar Waybar
~/.config/niri/scripts/start-waybar.sh

Lanza:

Waybar superior
Dock inferior
Panel rápido Eww
~/.config/eww/scripts/toggle-panel.sh
Wallpaper switcher
~/.config/niri/scripts/wallpaper-switcher.sh
App menu
~/.config/niri/scripts/app-menu.sh
Dock inteligente
~/.config/niri/scripts/focus-or-open.sh

Permite enfocar una app si ya está abierta o abrirla si no existe.

Atajos principales
Atajo	Acción
Super + Enter	Abrir Kitty
Super + D	Abrir Fuzzel
Super + A	App menu por categorías
Super + Shift + Q	Quick panel Eww
Super + Shift + W	Wallpaper switcher
Super + Escape	Bloquear pantalla
Super + Shift + E	Wlogout
Super + Alt + V	Historial de portapapeles
Super + B	Btop
Super + O	Overview de Niri
Características
Waybar superior

Barra superior translúcida con:

workspaces
ventana activa
música actual
reloj
CPU
RAM
red
audio
power
Dock inferior

Dock hecho con Waybar que abre o enfoca apps:

Archivos
Firefox
Kitty
Neovim
Fuzzel / App menu
Steam
Spotify
Btop
Power
Panel Eww

Centro de control con:

WiFi
Audio
Steam
Lock
CPU
RAM
Temperatura
Spotify / Now Playing
Slider de volumen
Btop
Clipboard
Power
Wallpaper switcher

Permite cambiar fondos con Fuzzel desde:

~/Pictures/Wallpapers

El wallpaper activo se copia a:

~/.config/niri/wallpaper.jpg
App menu por categorías

Launcher personalizado con Fuzzel:

Desarrollo
Internet
Juegos
Archivos
Sistema
Multimedia
Dock inteligente

El dock usa scripts para:

enfocar una app si ya está abierta
abrir la app si no existe

App IDs configurados actualmente:

Firefox  → org.mozilla.firefox
Kitty    → kitty
Steam    → steam
Spotify  → spotify
Notas sobre monitores

Configuración actual pensada para:

HDMI-A-1 → AOC 1920x1080
HDMI-A-2 → Dell 3840x2160 scale 1.5

El panel Eww está fijado a:

HDMI-A-1

Si se usa otro monitor, editar:

~/.config/eww/eww.yuck

y cambiar:

:monitor 1

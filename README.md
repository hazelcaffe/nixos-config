# `nixos-config`
> [!IMPORTANT]
> Hyprland coming soon!

My NixOS Configuration :D
```sh
sudo nixos-rebuild switch --flake /etc/nixos#pc
```

## Layout
> [!WARNING]
> AI Generated
```
/etc/nixos
├── flake.nix                  # Flake entrypoint for host `pc`
├── flake.lock                 # Locked input revisions
├── configuration.nix          # Legacy entrypoint, imports hosts/pc
├── hosts/
│   └── pc/
│       ├── default.nix        # Host-level options and module imports
│       └── hardware-configuration.nix
├── modules/
│   └── nixos/
│       ├── default.nix        # Imports all system modules
│       ├── desktop.nix        # Niri, Plasma, SDDM
│       ├── fonts.nix          # System fonts
│       ├── hardware.nix       # Audio, Bluetooth, graphics, NVIDIA
│       ├── packages.nix       # System packages
│       ├── programs.nix       # System program toggles
│       ├── services.nix       # SSH, Tailscale, Docker
│       ├── system.nix         # Boot, locale, networking, CA
│       └── users.nix          # User accounts and groups
├── home/
│   └── hazel/
│       ├── default.nix        # Imports all Home Manager modules
│       ├── cava.nix           # Cava package and config link
│       ├── niri.nix           # Niri/Noctalia user packages and config links
│       ├── packages.nix       # User packages
│       ├── programs.nix       # Ghostty, fetchers, git
│       └── zsh.nix            # Zsh, Starship, Zoxide
└── external/
    ├── cava                   # Cava config
    ├── fastfetch.jsonc        # Fastfetch config
    ├── ghostty                # Ghostty config
    ├── hyfetch.json           # Hyfetch config
    ├── niri/                  # KDL niri config used by Home Manager
    └── noctalia/              # Noctalia wallpaper and custom color scheme
```

## Programs/Packages
### System
```
curl, wget, bind
nano
htop, btop
pciutils, usbutils, nvtopPackages.nvidia
ghostty, obs-studio, qbittorrent
wine
```
### User/`home/hazel`
```
bat, delta, eza, fd, ripgrep, fastfetch
bun, node.js 26, pnpm, codex, piper (palantir opencode fork)
osu!stable, osu!lazer, hytale, prism launcher, lunar client, steam
google chrome, vesktop, proton vpn, obsidian, vscode
```

## Services/Features
- SSH Server (Password + root auth)
- Tailscale
- Docker
- NetworkManager
- PipeWire audio
- Bluetooth/Blueman
- Custom LAN root CA

## DEs/WMs
All Wayland
- KDE6
- Niri (modded `cachyos-niri-noctalia`)
- Hyprland (modded `lwilk0/1882-dots`)

Default session is currently `plasma`

### Login Manager
SDDM + `sddm-astronaut-theme` (Pixel sakura static)

### Theme
Light mode <3 I try to use Catppuccin Latte as much as possible (and pink accent color)

GTK is set to `catppuccin-latte-pink-standard`.


## Credit
- Niri config: (Modified) https://github.com/CachyOS/cachyos-niri-noctalia/
- Hyprland config: (Modified) https://github.com/lwilk0/1882-dots

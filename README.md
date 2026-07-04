# `nixos-config`
My NixOS Configuration :D
```sh
sudo nixos-rebuild switch --flake /etc/nixos#pc
```

## Screenshots
![KDE6](./screenshots/kde6.png)

## Layout
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
│       ├── desktop.nix        # Niri, Plasma, SDDM, keyring
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
│       ├── packages.nix       # User packages
│       ├── programs.nix       # Ghostty, fetchers, git
│       └── zsh.nix            # Zsh, Starship, Zoxide
└── external/
    ├── cava                    # Cava config
    ├── fastfetch.jsonc         # Fastfetch config
    ├── ghostty                 # Ghostty config
    ├── hyfetch.json            # Hyfetch config
```

## TODO
- Fonts... Fix the fonts... Different fonts...
- QEMU/VM stuff
- VNC/RDP
- Firewall
- Hyprland (Modded https://github.com/lwilk0/1882-dots)
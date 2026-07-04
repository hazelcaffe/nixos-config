{ pkgs, ... }:

let
    catppuccin-gtk-latte = pkgs.catppuccin-gtk.override {
        variant = "latte";
        accents = [ "pink" ];
    };
in

{
    ########################
    #### NIRI/NOCTALIA ####
    ########################

    home.packages = with pkgs; [
        catppuccin-gtk-latte
        nautilus
        noctalia-shell
        quickshell
    ];

    xdg.configFile."niri".source = ../../external/niri;

    home.file.".cache/noctalia/wallpapers.json" = {
        source = ../../external/noctalia/wallpapers.json;
        force = true;
    };

    xdg.configFile."noctalia/colorschemes/Catppuccin-Latte-Pink/Catppuccin-Latte-Pink.json" = {
        source = ../../external/noctalia/colorschemes/Catppuccin-Latte-Pink/Catppuccin-Latte-Pink.json;
        force = true;
    };

    dconf.settings."org/gnome/desktop/interface" = {
        color-scheme = "prefer-light";
        gtk-theme = "catppuccin-latte-pink-standard";
        cursor-theme = "capitaine-cursors";
    };
}

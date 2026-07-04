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
    xdg.configFile."noctalia".source = ../../external/noctalia;

    dconf.settings."org/gnome/desktop/interface" = {
        color-scheme = "prefer-light";
        gtk-theme = "catppuccin-latte-pink-standard";
        cursor-theme = "capitaine-cursors";
    };
}

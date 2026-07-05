{ pkgs, ... }:

{
    ##################
    #### PROGRAMS ####
    ##################

    programs.nix-ld = {
        enable = true;
        libraries = with pkgs; [
            alsa-lib
            at-spi2-atk
            at-spi2-core
            atk
            cairo
            cups
            dbus
            expat
            fontconfig
            freetype
            gdk-pixbuf
            glib
            gtk3
            libdrm
            libgbm
            libGL
            libxkbcommon
            nspr
            nss
            pango
            udev
            libx11
            libxcb
            libxcomposite
            libxdamage
            libxext
            libxfixes
            libxrandr
        ];
    };
    programs.zsh.enable = true;
}

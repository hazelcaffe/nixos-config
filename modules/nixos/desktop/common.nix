{ lib, pkgs, ... }:

let
    sddm-astronaut = pkgs.sddm-astronaut.override {
        embeddedTheme = "pixel_sakura";
    };

    sddm = pkgs.kdePackages.sddm.override (old: {
        extraPackages = (old.extraPackages or [ ]) ++ [
            sddm-astronaut
            pkgs.kdePackages.qtmultimedia
        ];
    });
in

{
    ###################
    #### KEYRING ####
    ###################

    services.gnome.gnome-keyring.enable = true;

    #########################
    #### DISPLAY MANAGER ####
    #########################

    services.displayManager.sddm = {
        enable = true;
        package = lib.mkForce sddm;
        wayland.enable = true;
        theme = "sddm-astronaut-theme";

        settings.Theme.Current = "sddm-astronaut-theme";
    };

    security.pam.services.sddm.enableGnomeKeyring = true;

    environment.systemPackages = [
        sddm-astronaut
    ];
}

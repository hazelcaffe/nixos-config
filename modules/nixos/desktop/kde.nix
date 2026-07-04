{ pkgs, ... }:

{
    imports = [
        ./common.nix
    ];

    ################
    #### PLASMA ####
    ################

    services.desktopManager.plasma6.enable = true;

    environment.systemPackages = with pkgs; [
        (catppuccin-kde.override {
            flavour = [ "latte" ];
            accents = [ "pink" ];
        })
        kdePackages.ark
        kdePackages.dolphin
    ];
}

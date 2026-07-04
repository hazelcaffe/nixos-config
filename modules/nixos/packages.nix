{ pkgs, ... }:

{
    #########################
    #### SYSTEM PACKAGES ####
    #########################

    environment.systemPackages = with pkgs; [
        curl
        wget
        nano
        htop
        btop
        bind
        pciutils
        usbutils
        nvtopPackages.nvidia
        ghostty
        obs-studio
        qbittorrent
        wine
        (catppuccin-kde.override {
            flavour = [ "latte" ];
            accents = [ "pink" ];
        })
        kdePackages.ark
        kdePackages.dolphin
    ];
}

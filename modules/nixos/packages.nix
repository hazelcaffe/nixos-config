{ pkgs, ... }:

{
    #########################
    #### SYSTEM PACKAGES ####
    #########################

    environment.systemPackages = with pkgs; [
        curl
        wget
        zip
        unzip
        jq
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
    ];
}

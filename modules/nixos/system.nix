{ pkgs, ... }:

{
    ##############
    #### BOOT ####
    ##############

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    boot.kernelPackages = pkgs.linuxPackages_latest;

    boot.initrd.kernelModules = [
        "nvidia"
    ];

    ################
    #### LOCALE ####
    ################

    time.timeZone = "America/New_York";
    i18n.defaultLocale = "en_US.UTF-8";

    ####################
    #### NETWORKING ####
    ####################

    networking.hostName = "eon";
    networking.networkmanager.enable = true;
    networking.firewall.enable = false;


    ############
    #### CA #### I have a custom CA for LAN domains (e.g. pve.lab)
    ############
 
    security.pki.certificateFiles = [
        ../../certs/root_ca.crt
    ];
}

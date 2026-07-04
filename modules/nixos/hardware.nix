{ config, ... }:

{
    ###############
    #### AUDIO ####
    ###############

    security.rtkit.enable = true;

    services.pipewire = {
        enable = true;

        pulse.enable = true;

        alsa.enable = true;
        alsa.support32Bit = true;
    };

    ###################
    #### BLUETOOTH ####
    ###################

    hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
    };

    services.blueman.enable = true;

    ##################
    #### GRAPHICS ####
    ##################

    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };

    services.xserver.videoDrivers = [
        "nvidia"
    ];

    ################
    #### NVIDIA ####
    ################

    hardware.nvidia = {
        open = false;

        package = config.boot.kernelPackages.nvidiaPackages.stable;

        modesetting.enable = true;

        nvidiaSettings = true;

        powerManagement.enable = false;
        powerManagement.finegrained = false;
    };
}

{ pkgs, ... }:

{
    ##############
    #### SUDO ####
    ##############

    security.sudo.enable = true;

    ###############
    #### USERS ####
    ###############

    users.users.hazel = {
        isNormalUser = true;
        description = "Hazel";
        shell = pkgs.zsh;

        extraGroups = [
            "wheel"
            "networkmanager"
            "docker"
            "video"
            "audio"
        ];
    };
}

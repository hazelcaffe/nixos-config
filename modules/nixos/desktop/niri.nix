{ pkgs, ... }:

{
    imports = [
        ./common.nix
    ];

    ##############
    #### NIRI ####
    ##############

    programs.niri = {
        enable = true;
        package = pkgs.niri;
    };
}

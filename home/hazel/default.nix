{ ... }:

{
    imports = [
        ./cava.nix
        ./fastfetch.nix
        ./niri.nix
        ./packages.nix
        ./programs.nix
        ./zsh.nix
    ];

    ##############
    #### HOME ####
    ##############

    home = {
        username = "hazel";
        homeDirectory = "/home/hazel";
        stateVersion = "26.05";
    };

    ##################
    #### PROGRAMS ####
    ##################

    programs.home-manager.enable = true;
}

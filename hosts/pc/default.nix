{ ... }:

{
    imports = [
        ./hardware-configuration.nix
        ../../modules/nixos
    ];

    nix.settings.experimental-features = [
        "nix-command"
        "flakes"
    ];

    nixpkgs.config.allowUnfree = true;
    systemd.defaultUnit = "graphical.target";
    system.stateVersion = "26.05";
}

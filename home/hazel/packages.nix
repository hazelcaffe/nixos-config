{ inputs, pkgs, ... }:

{
    #######################
    #### USER PACKAGES ####
    #######################

    home.packages = with pkgs; [
        bat
        delta
        eza
        fd
        ripgrep
        bun
        nodejs_26
        pnpm
        codex
        inputs.piper.packages.${pkgs.stdenv.hostPlatform.system}.opencode
        inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.osu-stable
        inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.osu-lazer-bin
        inputs.hytale-launcher-nix.packages.${pkgs.stdenv.hostPlatform.system}.hytale-launcher
        cider-2
        google-chrome
        fastfetch
        hyfetch
        lunar-client
        obsidian
        prismlauncher
        steam
        vesktop
        vscode
        proton-vpn
    ];
}

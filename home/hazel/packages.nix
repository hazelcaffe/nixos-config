{ inputs, pkgs, ... }:

{
    #######################
    #### USER PACKAGES ####
    #######################

    home.packages = with pkgs; [
        bat
        delta
        duf
        dust
        eza
        fd
        gh
        rm-improved
        ripgrep
        sd
        bun
        nodejs_26
        pnpm
        codex
        inputs.piper.packages.${pkgs.stdenv.hostPlatform.system}.opencode
        inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.osu-stable
        inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.osu-lazer-bin
        inputs.hytale-launcher-nix.packages.${pkgs.stdenv.hostPlatform.system}.hytale-launcher
        cider-2
        (symlinkJoin {
            name = "google-chrome";
            paths = [ google-chrome ];
            buildInputs = [ makeWrapper ];
            postBuild = ''
                wrapProgram $out/bin/google-chrome --add-flags "--password-store=kwallet"
                wrapProgram $out/bin/google-chrome-stable --add-flags "--password-store=kwallet"
            '';
        })
        fastfetch
        hyfetch
        lunar-client
        librepods
        obsidian
        prismlauncher
        steam
        vesktop
        vlc
        vscode
        zed-editor
        proton-vpn
    ];
}

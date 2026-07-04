{ lib, ... }:

{
    #############
    #### ZSH ####
    #############

    programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            cat = "bat";
            df = "duf";
            diff = "delta";
            du = "dust";
            find = "fd";
            ls = "eza";
            rm = "rip";
            rp = "rg";
            tree = "eza --tree";
        };

        oh-my-zsh = {
            enable = true;
            plugins = [
                "git"
                "sudo"
            ];
        };

        initContent = lib.mkAfter ''
            fastfetch() {
                hyfetch "$@"
            }
        '';
    };

    ##################
    #### STARSHIP ####
    ##################

    programs.starship = {
        enable = true;
        enableZshIntegration = true;
        enableTransience = true;

        settings = {
            add_newline = true;
            command_timeout = 1000;
            palette = "hazel";
            format = "$os$username$hostname$directory$git_branch$git_status$nix_shell$cmd_duration$line_break$character";
            right_format = "$status$jobs$time";

            palettes.hazel = {
                pink = "#f5bde6";
                mauve = "#c6a0f6";
                blue = "#8aadf4";
                teal = "#8bd5ca";
                green = "#a6da95";
                yellow = "#eed49f";
                peach = "#f5a97f";
                red = "#ed8796";
                text = "#cad3f5";
                surface = "#363a4f";
            };

            os = {
                disabled = false;
                style = "bold mauve";
                symbols.NixOS = " ";
            };

            username = {
                style_user = "bold pink";
                style_root = "bold red";
                format = "[$user]($style)";
                show_always = true;
            };

            hostname = {
                ssh_only = false;
                ssh_symbol = "󰣀 ";
                style = "bold peach";
                format = "[@$ssh_symbol$hostname]($style) ";
            };

            directory = {
                style = "bold blue";
                read_only = " 󰌾";
                truncation_length = 3;
                truncate_to_repo = false;
                format = "[$path]($style)[$read_only]($read_only_style) ";
            };

            git_branch = {
                symbol = " ";
                style = "bold mauve";
                format = "[$symbol$branch(:$remote_branch)]($style) ";
            };

            git_status = {
                style = "bold yellow";
                format = "([$all_status$ahead_behind]($style) )";
                conflicted = "=";
                ahead = "⇡$count";
                behind = "⇣$count";
                diverged = "⇕⇡$ahead_count⇣$behind_count";
                up_to_date = "";
                untracked = "?$count";
                stashed = "*$count";
                modified = "!$count";
                staged = "+$count";
                renamed = "»$count";
                deleted = "✘$count";
            };

            nix_shell = {
                symbol = " ";
                style = "bold teal";
                format = "[$symbol$name]($style) ";
            };

            cmd_duration = {
                min_time = 1000;
                style = "bold yellow";
                format = "[took $duration]($style) ";
            };

            status = {
                disabled = false;
                symbol = "✘";
                success_symbol = "";
                style = "bold red";
                format = "[$symbol $status]($style) ";
            };

            jobs = {
                symbol = "󰜎 ";
                style = "bold teal";
                format = "[$symbol$number]($style) ";
            };

            time = {
                disabled = false;
                time_format = "%H:%M";
                style = "bold surface";
                format = "[ $time]($style)";
            };

            character = {
                success_symbol = "[❯](bold green)";
                error_symbol = "[❯](bold red)";
                vimcmd_symbol = "[❮](bold green)";
            };
        };
    };

    programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
        options = [
            "--cmd cd"
        ];
    };
}

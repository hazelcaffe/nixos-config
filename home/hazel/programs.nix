{ ... }:

{
    ################
    #### GHOSTTY ####
    ################

    xdg.configFile."ghostty/config".source = ../../external/ghostty;

    #################
    #### FETCHERS ####
    #################

    xdg.configFile."fastfetch/config.jsonc".source = ../../external/fastfetch.jsonc;

    xdg.configFile."hyfetch.json" = {
        source = ../../external/hyfetch.json;
        force = true;
    };

    #############
    #### GIT ####
    #############

    programs.git = {
        enable = true;

        settings = {
            user = {
                name = "Hazelcaffe";
                email = "hazel@qwq.sh";
            };

            init.defaultBranch = "main";
            pull.rebase = false;
            core.pager = "delta";
            interactive.diffFilter = "delta --color-only";

            delta = {
                navigate = true;
                side-by-side = true;
            };
        };
    };

}

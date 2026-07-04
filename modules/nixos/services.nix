{
    #############
    #### SSH ####
    #############

    services.openssh = {
        enable = true;

        settings = {
            PermitRootLogin = "yes";
            PasswordAuthentication = true;
        };
    };

    ###################
    #### TAILSCALE ####
    ###################

    services.tailscale.enable = true;

    ##################
    #### DOCKER ####
    ##################

    virtualisation.docker.enable = true;
}

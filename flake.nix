{
    description = "My NixOS config";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        piper = {
            url = "github:hazelcaffe/Piper";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nix-gaming = {
            url = "github:fufexan/nix-gaming";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hytale-launcher-nix = {
            url = "github:JPyke3/hytale-launcher-nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs@{ self, nixpkgs, home-manager, ... }:
        let
            system = "x86_64-linux";
            host = "pc";
            hostname = "eon";
            username = "hazel";

            mkSystem = name: desktopModule: homeModules: nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs = {
                    inherit inputs hostname username;
                };

                modules = [
                    ./hosts/${host}
                    desktopModule
                    home-manager.nixosModules.home-manager
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            extraSpecialArgs = {
                                inherit inputs hostname username;
                            };
                            users.${username} = {
                                imports = [
                                    ./home/${username}
                                ] ++ homeModules;
                            };
                        };
                    }
                ];
            };

            mkKdeSystem = name: mkSystem name ./modules/nixos/desktop/kde.nix [ ];
            mkNiriSystem = name: mkSystem name ./modules/nixos/desktop/niri.nix [
                ./home/${username}/niri.nix
            ];
        in
        {
            nixosConfigurations."${host}-kde" = mkKdeSystem "${host}-kde";
            nixosConfigurations."${host}-niri" = mkNiriSystem "${host}-niri";
        };
}

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
            hostname = "pc";
            username = "hazel";
        in
        {
            nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs = {
                    inherit inputs hostname username;
                };

                modules = [
                    ./hosts/${hostname}
                    home-manager.nixosModules.home-manager
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            extraSpecialArgs = {
                                inherit inputs hostname username;
                            };
                            users.${username} = import ./home/${username};
                        };
                    }
                ];
            };
        };
}

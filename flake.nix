{
    description = "My NixOS flake";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, home-manager, ... }: {
        nixosConfigurations = {
            /* my home desktop */
            honeybee = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    /* Host-specific config */
                    ./hosts/honeybee.nix

                    /* Host-independent config */
                    ./cannectivity.nix
                    ./configuration.nix
                    ./greetd.nix
                    ./locale.nix
                    ./network-mounts.nix

                    /* Home-manager config */
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.leon = import ./users/leon/home.nix;
                        home-manager.backupFileExtension = "bak";
                    }
                ];
            };
            /* TODO: add work laptop */
            /* TODO: add homeserver */
        };
    };
}

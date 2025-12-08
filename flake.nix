{
    description = "My NixOS flake";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-25.11";
        home-manager = {
            url = "github:nix-community/home-manager/release-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, home-manager, ... }@inputs:
        let
            /* Common modules shared across all hosts */
            commonModules = [
                ./cannectivity.nix
                ./configuration.nix
                ./greetd.nix
                ./locale.nix
                ./maintenance.nix
                ./network-mounts.nix
                ./openocd.nix

                /* Home-manager config */
                home-manager.nixosModules.home-manager {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.leon = import ./users/leon/home.nix;
                    home-manager.backupFileExtension = "bak";
                }
            ];
        in {
            nixosConfigurations = {
                /* My home desktop */
                honeybee = nixpkgs.lib.nixosSystem {
                    specialArgs = { inherit inputs; };
                    system = "x86_64-linux";
                    modules = [
                        ./hosts/honeybee.nix
                    ] ++ commonModules;
                };
                /* My work laptop */
                caterpillar = nixpkgs.lib.nixosSystem {
                    specialArgs = { inherit inputs; };
                    system = "x86_64-linux";
                    modules = [
                        ./hosts/caterpillar.nix
                    ] ++ commonModules;
                };
                /* TODO: add homeserver */
            };
        };
}

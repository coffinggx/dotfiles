{
  description = "Coffin-nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
        url = "git+https://github.com/nix-community/home-manager.git";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim";
    zen-browser = {
        url = "github:youwen5/zen-browser-flake";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs,home-manager,nixvim, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager{
                home-manager = {
                    useGlobalPkgs = true;
                    useUserPackages = true;
                    extraSpecialArgs = {
                      inherit inputs;
                    };

                    users.coffinggx = {
                        imports = [
                         ./home.nix
                         nixvim.homeModules.nixvim
                        ];
                    };

                    backupFileExtension = "backup";
                };
         }
      ];
    };
  };
}

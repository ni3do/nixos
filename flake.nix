
{
  description = "niedo nix-darwin system homelab flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    nixpkgs-stable = {
      url = "github:nixos/nixpkgs/nixos-24.11";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      nix-darwin,
      nix-homebrew,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;

      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      nixosModules = import ./modules/nixos;
      darwinModules = import ./modules/darwin;

      legacyPackages = forAllSystems (
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
      );

      createNixOS =
        system: hostname: username: fullname: email:
        (
          let
            commonVars = ((import (./. + "/hosts/shared/vars.nix")) system hostname username fullname email);
            systemSpecificVars = (import (./. + "/hosts/${commonVars.hostname}/vars.nix"));
            vars = commonVars // systemSpecificVars;

            specialArgs = { inherit inputs outputs vars; };

            modules = (builtins.attrValues nixosModules) ++ [
              (./. + "/hosts/${vars.hostname}")
            ];
          in
          nixpkgs.lib.nixosSystem { inherit system modules specialArgs; }
        );

      createDarwin =
        hostname: username: fullname: email:
        (
          let
            system = "aarch64-darwin";
            vars = ((import (./. + "/hosts/shared/vars.nix")) system hostname username fullname email);

            specialArgs = {
              inherit
                inputs
                outputs
                vars
                ;
            };
            modules = (builtins.attrValues darwinModules) ++ [
              (./. + "/hosts/${hostname}")
              nix-homebrew.darwinModules.nix-homebrew
              {
                nix-homebrew = {
                  enable = true;
                  user = username;
                  enableRosetta = true;
                  autoMigrate = true;
                  # mutableTaps = false;
                };
              }
            ];
          in
          nix-darwin.lib.darwinSystem { inherit specialArgs modules; }
        );
    in
    {
      inherit legacyPackages;

      formatter = forAllSystems (system: nixpkgs.legacyPackages."${system}".nixpkgs-rfc-style);

      overlays = import ./overlays { inherit inputs; };

      # nixosConfigurations = {
      #   malenia = createNixOS "x86_64-linux" "malenia" "bruno" "Bruno Pimentel" "hello@bruno.so";
      #   miquella = createNixOS "aarch64-linux" "miquella" "bruno" "Bruno Pimentel" "hello@bruno.so";
      # };

      darwinConfigurations = {
        madara = createDarwin "madara" "simon" "Simon Wachter" "simon.wachter@outlook.com";
      };

      darwinPackages = self.darwinConfigurations.${outputs.networking.hostName}.pkgs;
    };
}

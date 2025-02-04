
{
  description = "niedo nix-darwin system homelab flake";

  inputs = {
    nixpkgs = {
      # TODO: switch back to unstable
      url = "github:nixos/nixpkgs/nixos-24.11";
    };
    nixpkgs-stable = {
      url = "github:nixos/nixpkgs/nixos-24.11";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    # TODO: check if these are wanted
    # impermanence = {
    #   url = "github:nix-community/impermanence";
    # };
    # textfox = {
    #   url = "github:adriankarlen/textfox";
    # };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      nix-darwin,
      nix-homebrew,
      home-manager,
      agenix,
      # impermanence,
      # textfox,
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
      homeManagerModules = import ./modules/home-manager;

      legacyPackages = forAllSystems (
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
      );

      buildHomeManagerConfig =
        hostname:
        let
          rootPath = "/etc/nixos/modules/home-manager";
          hostPath = "${rootPath}/hosts/${hostname}";
          sharedPath = "${rootPath}/shared";
        in
        {
          linkHostApp = config: app: config.lib.file.mkOutOfStoreSymlink "${hostPath}/${app}/config";
          linkSharedApp = config: app: config.lib.file.mkOutOfStoreSymlink "${sharedPath}/${app}/config";
        };

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
              agenix.nixosModules.default
              # impermanence.nixosModules.impermanence
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users."${vars.defaultUser}" = homeManagerModules;
                home-manager.extraSpecialArgs = specialArgs // {
                  homeManagerConfig = buildHomeManagerConfig vars.hostname;
                };
              }
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
              agenix.nixosModules.default
              home-manager.darwinModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users."${username}" = homeManagerModules;
                home-manager.extraSpecialArgs = specialArgs // {
                  homeManagerConfig = buildHomeManagerConfig hostname;
                };
              }
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

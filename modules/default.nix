{ vars, ... }:

{
  imports = [
    (./. + "/hosts/${vars.hostname}")
    (./. + "/users/${vars.defaultUser}.nix")
    ./shared
  ];

  home = {
    username = vars.defaultUser;
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.05";
  };
}

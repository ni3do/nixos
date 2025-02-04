{
  config,
  vars,
  ...
}:

let
  home = config.home.homeDirectory;
in
{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      AddKeysToAgent yes
      ServerAliveInterval 60
    '';
    matchBlocks =
      if (vars.system != "aarch64-darwin") then
        {
          "github.com" = {
            hostname = "github.com";
            user = "bfpimentel";
            identityFile = "${home}/.ssh/id_personal";
          };
        }
      else
        {
          "jarvis" = {
            hostname = "192.168.0.112";
            user = "root";
            identityFile = "${home}/.ssh/id_ed25519";
          };
        };
  };
}

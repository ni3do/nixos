{
  config,
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
    matchBlocks = {
      "jarvis" = {
        hostname = "192.168.0.112";
        user = "root";
        identityFile = "${home}/.ssh/id_ed25519";
      };
      "media-server" = {
        hostname = "192.168.0.100";
          user = "simon";
      };
      "raspi" = {
        hostname = "192.168.1.120";
        user = "simon";
      };
      "euler" = {
        hostname = "euler.ethz.ch";
        user = "siwachte";
      };
      "disco" = {
        hostname = "tik42x.ethz.ch";
        user = "siwachte";
      };
      "disco-world" = {
        hostname = "tik42x.ethz.ch";
        user = "siwachte";
        proxyJump = "siwachte@login.ee.ethz.ch";
      };
    };
  };
}

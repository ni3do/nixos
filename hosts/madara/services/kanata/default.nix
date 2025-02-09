{
  config,
  vars,
  ...
}:

let
  kanataPath = "${config.users.users.${vars.defaultUser}.home}/.config/kanata";
in
{
  launchd.daemons.kanata = {
    command = "/Users/simon/.config/kanata/kanata -c /Users/simon/.config/kanata/personal.kbd";
    serviceConfig = {
      Label = "org.nixos.kanata";
      UserName = "root";
      GroupName = "root";
      RunAtLoad = true;
      KeepAlive = true;
      StandardOutPath = "/Library/Logs/Kanata/kanata.out.log";
      StandardErrorPath = "/Library/Logs/Kanata/kanata.err.log";
    };
  };
}

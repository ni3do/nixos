{
  config,
  vars,
  ...
}:
{
  launchd.user.agents.kanata = {
    command = "/Users/simon/.config/kanata/kanata -c /Users/simon/.config/kanata/personal.kbd";
    serviceConfig = {
      Label = "org.nixos.kanata";
      UserName = "root";
      GroupName = "root";
      RunAtLoad = true;
      KeepAlive = true;
      StandardOutPath = "/var/logs/kanata.out.log";
      StandardErrorPath = "/var/logs/kanata.err.log";
    };
  };
}

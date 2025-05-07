{
  config,
  vars,
  ...
}:
{
  launchd.daemons.kanata = {
    # script = "/Users/simon/.config/kanata/kanata -c /Users/simon/.config/kanata/personal.kbd";
    # script = "echo Hello";
    script = "n=1 ; while true ; do echo -n 'Command launch #$n: ' ; sleep 1 ; n=$(( n + 1 )) ; done";
    serviceConfig = {
      Label = "org.nixos.kanata";
      UserName = "root";
      GroupName = "root";
      RunAtLoad = true;
      KeepAlive = true;
      StandardOutPath = "/var/log/kanata.out.log";
      StandardErrorPath = "/var/log/kanata.err.log";
    };
  };
}

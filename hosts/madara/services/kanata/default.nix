{
  config,
  vars,
  ...
}:
{
  launchd = {
    user = {
      agents = {
        kanata = {
          # command = "sudo ~/.config/kanata/kanata -c /Users/simon/.config/kanata/personal.kbd";
          command = "sudo /opt/homebrew/bin/kanata -c /Users/simon/.config/kanata/personal.kbd";
          serviceConfig = {
            KeepAlive = true;
            RunAtLoad = true;
            StandardOutPath = "/tmp/kanata.out.log";
            StandardErrorPath = "/tmp/kanata.err.log";
          };
        };
      };
    };
  };
}

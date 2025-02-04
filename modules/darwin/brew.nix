{ ... }:

{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    taps = [
      "felixkratz/formulae"
    ];
    brews = [
      "mas"
      "rust"
      "sketchybar"
    ];
    casks = [
      { name = "cursor"; greedy = true; }
      { name = "firefox"; greedy = true; }
      { name = "font-sf-pro"; greedy = true; }
      { name = "macs-fan-control"; greedy = true; }
      { name = "nordvpn"; greedy = true; }
      { name = "karabiner-elements"; greedy = true; }
      # temporary office
      { name = "microsoft-teams"; greedy = true; }
      { name = "zoom"; greedy = true; }
    ];
    masApps = {
      "AdGuard for Safari" = 1440147259;
      "Bitwarden" = 1352778147; 
      "Wireguard" = 1451685025;
      "Vimari" = 1480933944;
      };
  };
}

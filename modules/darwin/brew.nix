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
      "7sedam7/krafna"
    ];
    brews = [
      "krafna"
      "lua"
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
      { name = "notion"; greedy = true; }
      { name = "notion-enhanced"; greedy = true; }
      { name = "obsidian"; greedy = true; }
      { name = "rectangle"; greedy = true; }
      { name = "spotify"; greedy = true; }
      { name = "telegram-desktop"; greedy = true; }
      { name = "visual-studio-code"; greedy = true; }
      { name = "whatsapp"; greedy = true; }
      { name = "zoom"; greedy = true; }
      { name = "karabiner-elements"; greedy = true; }
      # temporary office
      { name = "microsoft-teams"; greedy = true; }
      { name = "zoom"; greedy = true; }
      # fonts
      { name = "font-jetbrains-mono-nerd-font"; greedy = true; }
    ];
    masApps = {
      "AdGuard for Safari" = 1440147259;
      "Bitwarden" = 1352778147; 
      "Keynote" = 409183694;
      "Vimari" = 1480933944;
      "Wireguard" = 1451685025;
      };
  };
}

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
      "koekeishiya/formulae"
    ];
    brews = [
      "borders"
      "skhd"
      "kanata"
      # sketchybar dependency
      "lua"
      "mas"
      # sketchybar dependency
      "nowplaying-cli"
      "sketchybar"
      # sketchybar dependency
      "switchaudio-osx"
      "yabai"
    ];
    casks = [
      # browser
      { name = "firefox"; greedy = true; }
      # productivity
      { name = "cursor"; greedy = true; }
      { name = "obsidian"; greedy = true; }
      { name = "raycast"; greedy = true; }
      { name = "unnaturalscrollwheels"; greedy = true; }
      { name = "visual-studio-code"; greedy = true; }
      { name = "karabiner-elements"; greedy = true; }
      # util
      { name = "macs-fan-control"; greedy = true; }
      { name = "nordvpn"; greedy = true; } 
      { name = "spotify"; greedy = true; }
      { name = "telegram-desktop"; greedy = true; }
      { name = "whatsapp"; greedy = true; }
      # fonts
      { name = "font-sf-pro"; greedy = true; }
      { name = "font-jetbrains-mono-nerd-font"; greedy = true; }
    ];
    masApps = {
      "AdGuard for Safari" = 1440147259;
      "Bitwarden" = 1352778147; 
      "Vimari" = 1480933944;
      "Wireguard" = 1451685025;
      };
  };
}

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
      # for sketchybar and borders
      "felixkratz/formulae"
      # for aerospace
      "nikitabobko/tap"
    ];
    brews = [
      # nice borders around macos windows
      "borders"
      # keyboard daemon
      "kanata"
      # terminal AppStore manager
      "mas"
      # nice top bar for macos
      "sketchybar"
      # terminal prompt
      "starship"
    ];
    casks = [
      # window manager
      { name = "aerospace"; greedy = true; }
      # terminal emulator
      { name = "ghostty"; greedy = true; }
      # ide
      { name = "cursor"; greedy = true; }
      { name = "visual-studio-code"; greedy = true; }
      # browser
      { name = "firefox"; greedy = true; }
      # misc
      { name = "chatgpt"; greedy = true; }
      { name = "discord"; greedy = true; }
      { name = "macs-fan-control"; greedy = true; }
      { name = "nordvpn"; greedy = true; } 
      { name = "obsidian"; greedy = true; }
      { name = "raycast"; greedy = true; }
      { name = "spotify"; greedy = true; }
      { name = "telegram-desktop"; greedy = true; }
      { name = "unnaturalscrollwheels"; greedy = true; }
      { name = "whatsapp"; greedy = true; }
      # kanata dependency, needs the VirtualHIDKeyboard
      { name = "karabiner-elements"; greedy = true; }
      # fonts
      { name = "font-sf-pro"; greedy = true; }
      { name = "font-jetbrains-mono-nerd-font"; greedy = true; }
      { name = "font-sketchybar-app-font"; greedy = true; }
    ];
    masApps = {
      "AdGuard for Safari" = 1440147259;
      "Bitwarden" = 1352778147; 
      "Vimari" = 1480933944;
      "Wireguard" = 1451685025;
      };
  };
}

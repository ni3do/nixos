{ ... }:

{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      upgrade = true;
      cleanup = "zap";
    };

    taps = [
      "felixkratz/formulae"
    ];
    brews = [
      "coreutils"
      "kanata"
      "lua"
      "mas"
      "rust"
      "sketchybar"
    ];
    casks = [
      { name = "chatgpt"; greedy = true; }
      { name = "cursor"; greedy = true; }
      { name = "firefox"; greedy = true; }
      { name = "macs-fan-control"; greedy = true; }
      { name = "nordvpn"; greedy = true; } 
      { name = "obsidian"; greedy = true; }
      { name = "spotify"; greedy = true; }
      { name = "telegram-desktop"; greedy = true; }
      { name = "visual-studio-code"; greedy = true; }
      { name = "whatsapp"; greedy = true; }
      { name = "karabiner-elements"; greedy = true; }
      # fonts
      { name = "font-jetbrains-mono-nerd-font"; greedy = true; }
      { name = "font-sf-pro"; greedy = true; }
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

{ ... }:

{
  home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "code";
  };

  home.shellAliases = {
      # keybinding help
      "helpskhd" = "cat ~/.config/skhd/skhdrc";
      "helpyabai" = "cat ~/.config/yabai/yabairc";
      "ssh" = "TERM=xterm-256color ssh";
  };
  imports = [
    ./borders
    ./kanata
    ./kitty
    ./sketchybar
    ./skhd
    ./yabai
  ];
}

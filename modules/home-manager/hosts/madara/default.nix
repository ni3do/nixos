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
      "bordersr" = "borders style=round width=6.0 hidpi=on active_color=0xF0CBA6F7 inactive_color=0xFF1e1e2e background_color=0xFF313244";
      # improve shell utils
      "cat" = "bat";
      "rcat" = "cat";
      "ls" = "eza --long --color=always --icons=always --no-user";
      "rls" = "ls";
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

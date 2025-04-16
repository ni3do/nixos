{ ... }:

{
  home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "code";
  };

  home.shellAliases = {
      # aliases for common dirs
      "home" = "cd ~";
      # misc  aliases
      ".." = "cd ..";
      "x" = "exit";
      "vi" = "nvim";
      "mm" = "micromamba";
      # git aliases
      "add" = "git add";
      "commit" = "git commit";
      "pull" = "git pull";
      "gss" = "git status --short";
      "stat" = "git status";
      "gdiff" = "git diff HEAD";
      "vdiff" = "git difftool HEAD";
      "log" = "git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      "push" = "git push";
      "g" = "lazygit";
      "gaa" = "git add .";
      "gac" = "git add .; git commit -m 'auto-commit'; git push";
      "gacpp" = "git add .; git commit -m 'auto-commit'; git push; ssh disco-world 'cd /itet-stor/siwachte/net_scratch/fingnn && git pull'";
      # keybinding help
      "helpskhd" = "cat ~/.config/skhd/skhdrc";
      "helpyabai" = "cat ~/.config/yabai/yabairc";
      "ssh" = "TERM=xterm-256color ssh";
  };
  imports = [
    ./barik
    ./borders
    ./kanata
    ./kitty
    # ./sketchybar
    ./skhd
    ./yabai
  ];
}

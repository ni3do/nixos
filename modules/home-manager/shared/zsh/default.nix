{ ... }:
{
  programs.zsh = {
    enable = true;
    initExtra = "eval \"$(micromamba shell hook --shell zsh)\"";
    oh-my-zsh = {
      enable = true;
      theme = "powerlevel10k/powerlevel10k";
      plugins = [
        "zsh-autosuggestions"
        "zsh-completions"
        "zsh-syntax-highlighting"
      ];
    };
    shellAliases = {
      # aliases for common dirs
      home = "cd ~";
      # misc  aliases
      x = "exit";
      vi = "nvim";
      mm = "micromamba";
      # git aliases
      gss = "git status --short";
      stat = "git status";
      gaa = "git add .";
      gac = "git add .; git commit -m 'auto-commit'; git push";
      gacpp = "git add .; git commit -m 'auto-commit'; git push; ssh disco-world 'cd /itet-stor/siwachte/net_scratch/fingnn && git pull'";
      # keybinding help
      # "helpskhd" = "cat ~/.config/skhd/skhdrc";
      # "helpyabai" = "cat ~/.config/yabai/yabairc";
    };
  };

  home.file.".config/zsh" = {
    source = ./config;
    recursive = true;
  };
}

{ ... }:
{
  programs.tmux = {
    enable = true;
  };

  home.file.".config/tmux" = {
    source = ./config;
    recursive = true;
  };
}

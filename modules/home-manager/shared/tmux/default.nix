{ ... }:
{
  programs.tmux = {
    enable = true;
  };

  home.file.".config/.tmux.conf" = {
    source = ./config;
    recursive = true;
  };
}

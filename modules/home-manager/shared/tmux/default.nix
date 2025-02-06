{ ... }:
{
  programs.tmux = {
    enable = true;
  };

  home.file.".tmux.conf" = {
    source = ./config/tmux.conf;
  };
}

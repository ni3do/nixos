{
  pkgs,
  homeManagerConfig,
  config,
  ...
}:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withPython3 = true;
  };

  home.file.".config/nvim" = {
    source = ./config;
    recursive = true;
  };
}

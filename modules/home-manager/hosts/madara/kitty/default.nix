{ homeManagerConfig, config, ... }:

{
  home.file.".config/kitty" = {
    source = ./config;
    recursive = true;
  };
}

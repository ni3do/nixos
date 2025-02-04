{ homeManagerConfig, config, ... }:

{
  home.file.".config/kanata" = {
    source = ./config;
    recursive = true;
  };
}

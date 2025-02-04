{ homeManagerConfig, config, ... }:

{
  home.file.".config/borders" = {
    source = ./config;
    recursive = true;
  };
}

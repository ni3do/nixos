{ homeManagerConfig, config, ... }:

{
  home.file.".config/sketchybar" = {
    source = ./config;
    recursive = true;
  };
}

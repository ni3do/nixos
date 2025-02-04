{ homeManagerConfig, config, ... }:

{
  home.file.".config/yabai" = {
    source = ./config;
    recursive = true;
  };
}

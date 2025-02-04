{ homeManagerConfig, config, ... }:

{
  home.file.".config/borders".source = homeManagerConfig.linkHostApp config "borders";
}

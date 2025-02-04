{ ... }:

{
  home.file.".config/bat" = {
    source = ./config;
    recursive = true;
  };
}

{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      eval "$(micromamba shell hook --shell zsh)"
      export PEREC_DIR="/Users/simon/Library/Mobile Documents/iCloud~md~obsidian/Documents/main"
    '';
  };
}

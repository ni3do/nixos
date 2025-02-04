{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initExtra = "eval \"$(micromamba shell hook --shell zsh)\"";
    # oh-my-zsh = {
    #   enable = true;
    #   theme = "powerlevel10k/powerlevel10k";
    #   plugins = [
    #     "zsh-autosuggestions"
    #     "zsh-completions"
    #     "zsh-syntax-highlighting"
    #   ];
    # };
  };
}

{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      eval "$(micromamba shell hook --shell zsh)"
    '';

    shellAliases = {
      # aliases for common dirs
      home = "cd ~";
      # misc  aliases
      x = "exit";
      vi = "nvim";
      mm = "micromamba";
      # git aliases
      gss = "git status --short";
      gs = "git status";
      gdiff = "git diff HEAD";
      vdiff = "git difftool HEAD";
      log = "git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      gaa = "git add .";
      gac = "git add .; git commit -m 'auto-commit'; git push";
      ll = "ls -l";
      ndswitch = "nix --extra-experimental-features nix-command --extra-experimental-features flakes run nix-darwin -- switch --flake '.?submodules=1'";
    };
  };
}

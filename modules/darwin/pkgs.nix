{ pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # better command history
    atuin
    # better cat
    bat
    # better top
    btop
    discord
    # better ls
    eza
    # lazyvim picker dependency
    fd
    # command-line fuzzy finder
    fzf
    gh
    git
    # pokemon image cli
    krabby
    # python env and package manager
    micromamba
    neovim
    nodejs_22
    pre-commit
    python3
    # fzf dependency
    ripgrep
    texliveFull
    # Latex formatter
    tex-fmt
    tmux
    wget
    # pdf viewer
    zathura
    # smart cd
    zoxide
    zsh
  ];
}

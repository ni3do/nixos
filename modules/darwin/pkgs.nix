{ pkgs, ... }:

{
  programs.zsh.enable = true;

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
    # terminal emulator
    kitty
    # pokemon image cli
    krabby
    lua
    # python env and package manager
    micromamba
    neovim
    pre-commit
    python3
    # fzf dependency
    ripgrep
    # terminal prompt
    starship
    texliveFull
    # Latex formatter
    tex-fmt
    tmux
    wget
    # pdf viewer
    zathura
    zsh
  ];
}

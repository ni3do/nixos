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
    # better ls
    eza
    # lazyvim picker dependency
    fd
    # command-line fuzzy finder
    fzf
    # github cli
    gh
    # git
    git
    # pokemon image cli
    krabby
    # programming language
    lua
    # ide
    neovim
    nodejs_22
    # nu shell
    nushell
    # git utility to execute code pre-commit
    pre-commit
    # fzf dependency
    ripgrep
    # rust toolchain
    rustup
    # utility to place dotfiles
    stow
    # latex
    texliveFull
    # Latex formatter
    tex-fmt
    # terminal multiplexer
    tmux
    # python package manager
    uv
    # curl alternative
    wget
    # pdf viewer
    zathura
    # smart cd
    zoxide
    # shell
    zsh
  ];
}

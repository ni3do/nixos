{ pkgs, ... }:

{
  programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;

  # TODO: get fronts from packages rather than from brew
  # fonts.packages = with pkgs; [
  #   nerd-fonts.jetbrains-mono
  #   nerd-fonts.fira-mono
  #   nerd-fonts.profont
  #
  # ];

  environment.systemPackages = with pkgs; [
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
    # colored borders for user windows on macos
    jankyborders
    # terminal emulator
    kitty
    # pokemon image cli
    krabby
    lua
    # python env and package manager
    micromamba
    neovim
    nodejs_23
    # sketchybar dependency
    nowplaying-cli
    oh-my-zsh
    pre-commit
    python3
    # fzf dependency
    ripgrep
    signal-desktop
    # keyboard shortcut daemon for macos
    skhd
    spotify
    # terminal prompt
    starship
    # sketchybar dependency
    switchaudio-osx
    telegram-desktop
    texliveFull
    # Latex formatter
    tex-fmt
    tmux
    # invert scroll direction of physical scroll wheels
    unnaturalscrollwheels
    vscode
    wget
    # whatsapp-for-mac
    # tiling window manager for macos
    yabai
    # pdf viewer
    zathura
    zsh
  ];
}

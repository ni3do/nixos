{ pkgs, ... }:

{
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    atuin
    # better cat
    bat
    # better top
    btop
    discord
    # better ls
    eza
    # command-line fuzzy finder
    fzf
    gh
    git
    # colored borders for user windows on macos
    jankyborders
    # terminal emulator
    kitty
    lua
    # python env and package manager
    micromamba
    neovim
    nodejs_23
    # sketchybar dependency
    nowplaying-cli
    pre-commit
    python3
    # fzf dependency
    ripgrep
    signal-desktop
    # keyboard shortcut daemon for macos
    skhd
    spotify
    # macos top bar
    # sketchybar
    # terminal prompt
    starship
    # sketchybar dependency
    switchaudio-osx
    telegram-desktop
    tmux
    # invert scroll direction of physical scroll wheels
    unnaturalscrollwheels
    vscode
    wget
    whatsapp-for-mac
    # tiling window manager for macos
    yabai
    zsh
  ];
}

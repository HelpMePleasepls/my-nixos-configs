{ config, pkgs, ... }:

{
  # Define package collections/sets based on categories
  environment.systemPackages = with pkgs; [
    # System Tools
    btop
    nvtop
    appimage-run
    git
    lazygit
    neovim
    wget
    tree
    tmux
    ripgrep
    fd
    fzf
    fastfetch
    swtpm
    libGLU
    libGL
    mesa
    libvpx
    libva-utils
    ethtool
    lua54Packages.luarocks
    lrzip
    xclip
    viu
    chafa
    ueberzugpp
    unzip
    unrar
    rar
    zip
    vnstat
    nix-search-cli

    # Development Packages
    python314
    powerline-fonts
    gocryptfs
    nodejs_23
    gcc
    go
    php
    cargo
    zulu
    ruby
    julia
    python313Packages.pip
    tree-sitter
    sshfs

    # KDE Packages
    ksnip
    kdePackages.spectacle
    kdePackages.kolourpaint
    kdePackages.kruler
    kdePackages.qtwebengine
    kdePackages.plasma-vault
    menulibre
    mission-center
];

  # If you need to specify user-specific packages, you can do it this way:
  users.users.bob.packages = with pkgs; [
    # Add any user-specific packages here
    # Communication Packages
    vesktop
    protonmail-bridge
    protonmail-desktop
    zapzap
    signal-desktop
    discord-canary

    # Security Packages
    bitwarden-desktop
    tomb
    wireguard-tools
    # Office Packages
    libreoffice-qt6-fresh
    onlyoffice-desktopeditors

    # Other packages
    kicad
    qalculate-qt
    just
    josm
    gwe
    devtoolbox
  ];
}

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

    # KDE Packages
    kdePackages.kwin
    kdePackages.kdeconnect-kde
    ksnip
    kdePackages.spectacle
    kdePackages.qtwebengine
    kdePackages.knotifications
    kdePackages.plasma-vault
    kdePackages.discover
    kdePackages.plasma-browser-integration
    kdePackages.plasma-workspace
    kdePackages.sshfs
    menulibre
    mission-center
];

  # If you need to specify user-specific packages, you can do it this way:
  users.users.bob.packages = with pkgs; [
    # Add any user-specific packages here
    # Communication Packages
    vesktop
    thunderbird
    protonmail-bridge
    protonmail-desktop
    zapzap
    signal-desktop
    discord-canary
    # Gaming Packages
    steamtinkerlaunch
    protonup-qt
    protontricks
    lutris
    bottles
    gamescope
    mangohud
    goverlay
    alvr
    adwsteamgtk
    onboard
    # Security Packages
    bitwarden-desktop
    tomb
    wireguard-tools
    # Office Packages
    libreoffice-qt6-fresh
    onlyoffice-desktopeditors
    # Media Packages
    davinci-resolve
    losslesscut-bin
    ffmpeg
    imagemagick
    libjxl
    vlc
    mpv
    obs-studio
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    gimp
    (callPackage /home/bob/nixos-config/custom-nixpkgs/img2wav.nix {})
    audacity
    qbittorrent
    rclone
    ascii-image-converter
    inotify-tools
    inotify-info
    asciiquarium
    easyeffects
    audio-sharing
    qpwgraph
    ungoogled-chromium
    # Other packages
    kicad
    qalculate-qt
    just
    devtoolbox
  ];
}

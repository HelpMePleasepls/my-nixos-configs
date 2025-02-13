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

  users.users.bob.packages = with pkgs; [
    # Communication Packages
    vesktop
    protonmail-bridge
    protonmail-desktop
    zapzap
    signal-desktop
    discord-canary

    # Gaming Packages
    prismlauncher
    steamtinkerlaunch
    protonup-qt
    protontricks
    wineWow64Packages.full
    winePackages.wayland
    lutris
    bottles
    gamescope
    mangohud
    alvr
    mangojuice
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
    yt-dlp
    revolt-desktop
    drawio
    upscayl
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
    (callPackage ../custom-nixpkgs/img2wav.nix {})
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
    josm
    gwe
    devtoolbox
  ];
}

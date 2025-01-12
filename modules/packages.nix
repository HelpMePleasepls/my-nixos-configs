{ config, pkgs, ... }:
  # Define package collections/sets based on categories
  let
    developmentPackages = with pkgs; [
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
    ];

    mediaPackages = with pkgs; [
      davinci-resolve
      ffmpeg
      imagemagick
      vlc
      mpv
      obs-studio
      gpu-screen-recorder
      gpu-screen-recorder-gtk
      qbittorrent
      rclone
      ascii-image-converter
      inotify-tools
      inotify-info
      asciiquarium
      lrzip
      xclip
      viu
      chafa
      ueberzugpp
      unzip
      unrar
      rar
      zip
      easyeffects
      audio-sharing
      qpwgraph
    ];

    kdePackages = with pkgs; [
      kdePackages.kwin
      ksnip
      kdePackages.spectacle
      kdePackages.knotifications
      kdePackages.plasma-vault
      kdePackages.discover
      kdePackages.plasma-browser-integration
      menulibre
      mission-center
    ];

    securityPackages = with pkgs; [
      bitwarden-desktop
      tomb
      wireguard-tools
    ];

    gamingPackages = with pkgs; [
      steamtinkerlaunch
      protonup-qt
      protontricks
      lutris
      bottles
      gamemode
      gamescope
      mangohud
      goverlay
      alvr
      adwsteamgtk
    ];

    communicationPackages = with pkgs; [
      vesktop
      thunderbird
      protonmail-bridge
      protonmail-desktop
      zapzap
      signal-desktop
    ];

    systemTools = with pkgs; [
      btop
      nvtop
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
    ];

    officePackages = with pkgs; [
      libreoffice-qt6-fresh
      onlyoffice-desktopeditors
    ];

  in {
    # Apply to user packages
    users.users.bob.packages =
      developmentPackages ++
      mediaPackages ++
      gamingPackages ++
      communicationPackages ++
      officePackages;

    # Apply to system packages
    environment.systemPackages = systemTools;
  }

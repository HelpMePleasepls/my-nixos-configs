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

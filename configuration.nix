# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
boot = {
  tmpOnTmpfs = true;
  loader = {
  systemd-boot.enable = true;
  efi.canTouchEfiVariables = true;
};
  initrd.kernelModules = [ "nvidia" ];
  kernelParams = [
   "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
   "nvidia-drm.modeset=1"
  ];
};

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # enabble experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
   networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
   time.timeZone = "Europe/Helsinki";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
   i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # OPENGL enable
  hardware.graphics = {
  enable = true;
};
  hardware.enableRedistributableFirmware = true;

  # NVIDIA driver
services.xserver.videoDrivers = [ "nvidia" ];
 hardware.nvidia = {
  modesetting.enable = true;
  powerManagement.enable = true;
  open = false;
  nvidiaSettings = true;
  package = config.boot.kernelPackages.nvidiaPackages.beta;
 };
 # Enable X11 and Wayland
  services.xserver = {
    enable = true;
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
    desktopManager.plasma6.enable = true;
    layout = "us";
  };

  # Enable XDG Portal
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk];
  };




  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  security.rtkit.enable = true;
   services.pipewire = {
     enable = true;
     pulse.enable = true;
     alsa.enable = true;
     alsa.support32Bit = true;
     jack.enable = true;
   };

  # bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # flatpak
  services.flatpak.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

   # virtualization
   programs.virt-manager.enable = true;
   users.groups.libvirtd.members = ["bob"];
   virtualisation.libvirtd.enable = true;
   virtualisation.spiceUSBRedirection.enable = true;

   # optimise storage
   nix.optimise.automatic = true;
   nix.optimise.dates = [ "18:00" ]; # Optional; allows customizing optimisation schedule

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.bob = {
     isNormalUser = true;
     extraGroups = [ "wheel" "networkmanager" "video" "libvirtd" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
      tree
      davinci-resolve
      vesktop
      steamtinkerlaunch
      adwsteamgtk
      rclone
      ascii-image-converter
      tmux
      protonup-qt
      protontricks
      protonmail-bridge
      protonmail-desktop
      thunderbird
      python314
      nodejs_23
      gpu-screen-recorder
      gpu-screen-recorder-gtk
      ffmpeg
      imagemagick
      vlc
      mpv
      libva-utils
      libvpx
      obs-studio
      nvtop
      easyeffects
      bitwarden-desktop
      thunderbird
      mission-center
      lutris
      bottles
      alvr
      onboard
      ungoogled-chromium
      zapzap
      signal-desktop
      rustdesk
      menulibre
      qbittorrent
      tomb
      inotify-tools
      inotify-info
      gamemode
      gamescope
      mangohud
      goverlay
      libGL
      mesa
      libGLU
      watchexec
     ];
   };

   programs.fish.enable = true;
   programs.firefox.enable = true;
   programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
   programs.kdeconnect.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [
     neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     git
     lazygit
     tree-sitter
     fzf
     ripgrep
     fd
     gcc
     btop
     xclip
     kdePackages.discover
     kdePackages.plasma-vault
     kdePackages.knotifications
     kdePackages.spectacle
     ksnip
     gearlever
     kdePackages.kwin
     viu
     chafa
     ueberzugpp
     lua54Packages.luarocks
     unzip
     unrar
     rar
     zip
     go
     php
     cargo
     zulu
     ruby
     julia
     python313Packages.pip
     fastfetch
     ethtool
   ];

   # Enable dbus and other services
   services = {
   dbus.enable = true;
   printing.enable = true;
   };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
   networking.firewall = {
    enable = true;
    allowedTCPPortRanges = [
       { from = 1714; to = 1764; } # KDE Connect
      ];
    allowedUDPPortRanges = [
       { from = 1714; to = 1764; } # KDE Connect
      ];
    };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}


rebuild:
  sudo nixos-rebuild switch
edit:
  nvim /home/bob/justfile
nixconfig:
  nvim /home/bob/nixos-config/configuration.nix
nixpackages:
  nvim /home/bob/nixos-config/modules/packages.nix

{ pkgs, lib, config, ... }: {
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  imports = [
    ./neovim
    ./kitty
    ./hyprland
    ./fish
    ./discord
    ./zed
    ./fuentes
    ./git
    ./ulauncher
    ./xdg
    ./entornoDeDesarrollo.nix
  ];
}

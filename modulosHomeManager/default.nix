{ pkgs, lib, config, ... }: {
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  imports = [
    ./neovim
    ./kitty
    ./fish
    ./discord
    ./zed
    ./fuentes
    ./git
    ./entornoDeDesarrollo.nix
    ./wofi
    ./gtk
    ./hyprland
    ./dunst
    ./entornoHyprland.nix
  ];
}

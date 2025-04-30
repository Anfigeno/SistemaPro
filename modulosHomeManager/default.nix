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
    ./wofi
    ./gtk
    ./hyprland
    ./dunst
    ./copyq
    ./eww
    ./desktopEntries
    ./entornoHyprland.nix
    ./entornoDeDesarrollo.nix
  ];
}

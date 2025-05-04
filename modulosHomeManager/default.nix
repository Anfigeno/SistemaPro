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
    ./hyprland
    ./dunst
    ./eww
    ./desktopEntries
    ./cliphist
    ./obs
    ./stylix
    ./bat
    ./entornoHyprland
    ./entornoDeDesarrollo
  ];
}

{ pkgs, lib, config, ... }: {
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  imports = [
    ./neovim
    ./kitty
    ./fish
    ./vesktop
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
    ./zellij
    ./xdg
    ./btop
    ./eza
    ./yazi
    ./fzf
    ./direnv
    ./entornoHyprland
    ./entornoDeDesarrollo
    ./floorp
  ];
}

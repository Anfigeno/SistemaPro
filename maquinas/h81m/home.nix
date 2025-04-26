{ config, pkgs, inputs, ... }:

{
  imports = [ ../../modulosHomeManager ];
  config.modulosHomeManager = {
    neovim.activar = true;
    kitty.activar = true;
    hyprland.activar = true;
    fish.activar = true;
    discord.activar = true;
    zed.activar = true;
    fuentes.activar = true;
    git.activar = true;
    ulauncher.activar = true;
  };
}

{ config, pkgs, inputs, ... }:

{
  imports = [ ../../modulosHomeManager ];
  config.modulosHomeManager = {
    hyprland.activar = true;
    fuentes.activar = true;
    ulauncher.activar = true;
    xdg.activar = true;
    entornoDeDesarrollo.activar = true;
  };
}

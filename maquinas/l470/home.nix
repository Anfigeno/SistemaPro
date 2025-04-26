{ config, pkgs, inputs, ... }:

{
  imports = [ ../../modulosHomeManager ];
  config.modulosHomeManager = {
    entornoHyprland.activar = true;
    fuentes.activar = true;
    entornoDeDesarrollo.activar = true;
  };
}

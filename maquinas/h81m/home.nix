{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modulosHomeManager
    {
      config.modulosHomeManager = {
        fuentes.activar = true;
        entornoDeDesarrollo.activar = true;
        stylix.activar = true;
      };
    }
  ];

  home.packages = with pkgs; [ deskflow ];
}

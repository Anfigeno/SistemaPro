{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modulosHomeManager
    {
      config.modulosHomeManager = {
        entornoDeDesarrollo.activar = true;
        stylix.activar = true;
      };
    }
  ];

  home.packages = with pkgs; [ deskflow ];
}

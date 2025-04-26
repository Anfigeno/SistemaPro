{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modulosHomeManager
    {
      config.modulosHomeManager = {
        entornoHyprland.activar = true;
        fuentes.activar = true;
        entornoDeDesarrollo.activar = true;
      };
    }
  ];

  # Paquetes extra :)
  home.packages = with pkgs; [ sshfs nixd nixfmt-classic ];
}

{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modulosHomeManager
    {
      config.modulosHomeManager = {
        entornoHyprland.activar = true;
        fuentes.activar = true;
        entornoDeDesarrollo.activar = true;
        vesktop.activar = true;
        obs.activar = true;
      };
    }
  ];

  # Paquetes extra :)
  home.packages = with pkgs; [ prismlauncher deskflow qbittorrent caprine ];
}

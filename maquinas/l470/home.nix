{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modulosHomeManager
    {
      config.modulosHomeManager = {
        fuentes.activar = true;
        entornoDeDesarrollo.activar = true;
        vesktop.activar = true;
        obs.activar = true;
        stylix.activar = true;
        xdg.activar = true;
      };
    }
  ];

  # Paquetes extra :)
  home.packages = with pkgs; [ prismlauncher deskflow qbittorrent caprine ];
}

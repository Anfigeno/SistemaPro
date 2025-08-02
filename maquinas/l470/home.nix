{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modulosHomeManager
    {
      config.modulosHomeManager = {
        fuentes.activar = true;
        entornoDeDesarrollo.activar = true;
        entornoHyprland.activar = true;
        obs.activar = true;
        floorp.activar = true;
      };
    }
  ];

  # Paquetes extra :)
  home.packages = with pkgs; [
    prismlauncher
    qbittorrent
    revolt-desktop
    discord-ptb
  ];

  home.sessionVariables = {
    TERMINAL = "kitty";
    TERM = "kitty";
  };
}

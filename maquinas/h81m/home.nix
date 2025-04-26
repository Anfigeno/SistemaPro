{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modulosHomeManager
    {
      config.modulosHomeManager = {
        entornoHyprland.activar = true;
        discord.activar = true;
        fuentes.activar = true;
      };
    }
  ];
}

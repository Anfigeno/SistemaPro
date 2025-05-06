{ pkgs, lib, config, ... }:
let cfg = config.modulosNixos.hyprland;
in {
  options.modulosNixos.hyprland = {
    activar = lib.mkEnableOption "Activa el módulo de hyprland";
  };

  config = lib.mkIf cfg.activar {
    programs.hyprland.enable = true;
  };
}

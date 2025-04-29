{ pkgs, lib, config, ... }:
let cfg = config.modulosNixos.steam;
in {
  options.modulosNixos.steam = {
    activar = lib.mkEnableOption "Activa el módulo de steam";
  };

  config = lib.mkIf cfg.activar {
    programs.steam.enable = true;
    hardware.steam-hardware.enable = true;
  };
}

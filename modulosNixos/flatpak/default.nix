{ pkgs, lib, config, ... }:
let cfg = config.modulosNixos.flatpak;
in {
  options.modulosNixos.flatpak = {
    activar = lib.mkEnableOption "Activa el módulo de flatpak";
  };

  config = lib.mkIf cfg.activar {
    services.flatpak.enable = true;
  };
}

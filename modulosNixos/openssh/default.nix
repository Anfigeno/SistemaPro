{ pkgs, lib, config, ... }:
let cfg = config.modulosNixos.openssh;
in {
  options.modulosNixos.openssh = {
    activar = lib.mkEnableOption "Activa el módulo de openssh";
  };

  config = lib.mkIf cfg.activar { services.openssh.enable = true; };
}

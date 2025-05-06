{ pkgs, lib, config, ... }:
let cfg = config.modulosNixos.lightdm;
in {
  options.modulosNixos.lightdm = {
    activar = lib.mkEnableOption "Activa el módulo de lightdm";
  };

  config = lib.mkIf cfg.activar {
    services.xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
    };
  };
}

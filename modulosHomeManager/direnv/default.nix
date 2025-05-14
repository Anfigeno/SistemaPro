{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.direnv;
in {
  options.modulosHomeManager.direnv = {
    activar = lib.mkEnableOption "Activa el módulo de direnv";
  };

  config = lib.mkIf cfg.activar {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}

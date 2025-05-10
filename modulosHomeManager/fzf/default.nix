{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.fzf;
in {
  options.modulosHomeManager.fzf = {
    activar = lib.mkEnableOption "Activa el módulo de fzf";
  };

  config = lib.mkIf cfg.activar {
    programs.fzf = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}

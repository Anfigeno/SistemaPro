{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.eww;
in {
  options.modulosHomeManager.eww = {
    activar = lib.mkEnableOption "Activa el módulo de eww";
  };

  config = lib.mkIf cfg.activar {
    home.packages = with pkgs; [ jq ];

    programs.eww = {
      enable = true;
      configDir = ./config;
    };
  };
}

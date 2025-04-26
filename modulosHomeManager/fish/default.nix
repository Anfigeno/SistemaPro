{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.fish;
in {
  options.modulosHomeManager.fish = {
    activar = lib.mkEnableOption "Activa el módulo de fish";
  };

  config = lib.mkIf cfg.activar {
    home.packages = with pkgs; with pkgs.fishPlugins; [ fish tide done ];
  };
}

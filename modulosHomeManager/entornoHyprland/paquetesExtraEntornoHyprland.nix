{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.paquetesExtraEntornoHyprland;
in {
  options.modulosHomeManager.paquetesExtraEntornoHyprland = {
    activar =
      lib.mkEnableOption "Activa el módulo de paquetesExtraEntornoHyprland";
  };

  config = lib.mkIf cfg.activar {
    home.packages = with pkgs; [
      floorp
      mpv
      loupe
      mate.engrampa
      amberol
      nautilus
      nautilus-open-any-terminal
    ];
  };
}

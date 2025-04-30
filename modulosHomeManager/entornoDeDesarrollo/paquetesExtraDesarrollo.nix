{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.paquetesExtraDesarrollo;
in {
  options.modulosHomeManager.paquetesExtraDesarrollo = {
    activar = lib.mkEnableOption "Activa el módulo de paquetesExtraDesarrollo";
  };

  config = lib.mkIf cfg.activar {
    home.packages = with pkgs; [ jq sshfs nixd nixfmt-classic nil obsidian ];
  };
}

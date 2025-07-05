{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.paquetesExtraDesarrollo;
in {
  options.modulosHomeManager.paquetesExtraDesarrollo = {
    activar = lib.mkEnableOption "Activa el módulo de paquetesExtraDesarrollo";
  };

  config = lib.mkIf cfg.activar {
    home.packages = with pkgs; [
      # Herramientas
      fzf
      ripgrep
      xclip
      jq
      sshfs

      # Entornos de ejecución
      nodejs_20

      # Lenguajes de servidor
      nixd
      nil

      # Formateadores
      nixfmt-classic
    ];
  };
}

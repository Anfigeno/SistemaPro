{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.gtk;
in {
  options.modulosHomeManager.gtk = {
    activar = lib.mkEnableOption "Activa el módulo de gtk";
  };

  config = lib.mkIf cfg.activar {
    gtk = {
      enable = true;
      theme = {
        package = pkgs.tokyonight-gtk-theme;
        name = "Tokyonight-Dark";
      };
      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus-Dark";
      };
      font = {
        name = "Ubuntu";
        size = 10;
      };
    };
  };
}

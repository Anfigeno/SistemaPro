{ pkgs, lib, config, ... }:
let cfg = config.modulosNixos.thunar;
in {
  options.modulosNixos.thunar = {
    activar = lib.mkEnableOption "Activa el módulo de thunar";
  };

  config = lib.mkIf cfg.activar {
    services.gvfs.enable = true;

    programs.thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
        thunar-media-tags-plugin
        thunar-vcs-plugin
      ];
    };
  };
}

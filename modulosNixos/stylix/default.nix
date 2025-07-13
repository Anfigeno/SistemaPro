{ pkgs, lib, config, ... }:
let cfg = config.modulosNixos.stylix;
in {
  options.modulosNixos.stylix = {
    activar = lib.mkEnableOption "Activa el módulo de stylix";
  };

  config = lib.mkIf cfg.activar {
    stylix.enable = true;

    stylix.base16Scheme = (import ../../lib/mestizoBase16.nix).oscuro;
  };
}

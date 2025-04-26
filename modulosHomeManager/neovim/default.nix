{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.neovim;
in {
  options.modulosHomeManager.neovim = {
    activar = lib.mkEnableOption "Activa el módulo de Neovim";
  };

  config = lib.mkIf cfg.activar { programs.neovim.enable = true; };
}

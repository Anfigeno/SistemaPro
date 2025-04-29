{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.discord;
in {
  options.modulosHomeManager.discord = {
    activar = lib.mkEnableOption "Activa el módulo de discord";
  };

  config = lib.mkIf cfg.activar {
    home.packages = with pkgs; [
      discord
      discord-ptb
      discord-canary
      betterdiscordctl
    ];
  };
}

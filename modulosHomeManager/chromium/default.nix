{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.chromium;
in {
  options.modulosHomeManager.chromium = {
    activar = lib.mkEnableOption "Activa el módulo de chromium";
  };

  config = lib.mkIf cfg.activar {
    programs.chromium = {
      enable = true;
      extensions = [
        { # Ublock Origin Lite
          id = "ddkjiahejlhfcafbddmgiahcphecmpfh";
        }
        { # Stylus
          id = "clngdbkpkpeebahjckkjfobafhncgmne";
        }
      ];
    };
  };
}

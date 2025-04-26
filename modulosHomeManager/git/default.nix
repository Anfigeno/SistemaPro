{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.git;
in {
  options.modulosHomeManager.git = {
    activar = lib.mkEnableOption "Activa el módulo de git";
  };

  config = lib.mkIf cfg.activar {
    programs.git = {
      enable = true;
      extraConfig = {
        user.name = "anfigeno";
        user.email = "dolorcriticodevastador@proton.me";
        init.defaultBranch = "main";
      };
    };

    programs.gh.enable = true;
  };
}

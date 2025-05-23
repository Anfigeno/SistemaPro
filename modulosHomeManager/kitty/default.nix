{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.kitty;
in {
  options.modulosHomeManager.kitty = {
    activar = lib.mkEnableOption "Activa el módulo de Kitty";
  };

  config = lib.mkIf cfg.activar {
    home.packages = import ./paquetesExtra.nix { inherit pkgs; };

    programs.kitty = {
      enable = true;
      settings = {
        font_family = "Monaspace Neon Medium";
        bold_font = "Monaspace Krypton Medium";
        italic_font = "Monaspace Radon Medium";
        bold_italic_font = "Monaspace Radon Bold";

        shell = "fish";

        modify_font = ''
          cell_height 4px
        '';
        disable_ligatures = "never";

        font_features = ''
          MonaspaceNeon-Medium       +calt +ss01 +ss02 +ss03 +ss04 +ss05 +ss06 +ss07 +ss08 +ss09 +cv62 +case +liga
          MonaspaceKrypton-Medium    +calt +ss01 +ss02 +ss03 +ss04 +ss05 +ss06 +ss07 +ss08 +ss09 +cv62 +case +liga
          MonaspaceRadon-Medium      +calt +ss01 +ss02 +ss03 +ss04 +ss05 +ss06 +ss07 +ss08 +ss09 +cv62 +case +liga
          MonaspaceRadon-Bold        +calt +ss01 +ss02 +ss03 +ss04 +ss05 +ss06 +ss07 +ss08 +ss09 +cv62 +case +liga
        '';

        confirm_os_window_close = 0;
        window_padding_width = 15;
      };
    };
  };
}

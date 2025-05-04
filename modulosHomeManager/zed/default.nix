{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.zed;
in {
  options.modulosHomeManager.zed = {
    activar = lib.mkEnableOption "Activa el módulo de zed";
  };

  config = lib.mkIf cfg.activar {
    programs.zed-editor = {
      enable = true;
      extensions = [ "nix" "tokyo-night" ];
      userSettings = {
        tab_size = 2;
        indent_guides = { "enabled" = false; };
        vim_mode = false;
        soft_wrap = "editor_width";
        terminal = {
          font_weight = 300;
          line_height = "standard";
        };
        buffer_font_weight = 400;
        buffer_font_features = {
          calt = true;
          ss01 = true;
          ss02 = true;
          ss03 = true;
          ss04 = true;
          ss05 = true;
          ss06 = true;
          ss07 = true;
          ss08 = true;
          ss09 = true;
          liga = true;
        };
        buffer_font_fallbacks =
          [ "CaskaydiaCove Nerd Font" "Monaspace Neon Var" ];
        buffer_line_height = { custom = 2.2; };
      };
    };
  };
}

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
        font_family = "Iosevka Nerd Font";
        bold_font = "Iosevka Bold";
        italic_font = "Iosevka Italic";
        bold_italic_font = "Iosevka Nerd Bold Italic";

        shell = "fish";

        disable_ligatures = "never";

        font_size = 10;
        font_features = ''
          +calt
        '';

        modify_font = ''
          cell_height 8px
        '';

        confirm_os_window_close = 0;
        hide_window_decorations = true;
        window_padding_width = 4;
      };
    };
  };
}

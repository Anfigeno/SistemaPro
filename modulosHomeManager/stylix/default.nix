{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.stylix;
in {
  options.modulosHomeManager.stylix = {
    activar = lib.mkEnableOption "Activa el módulo de stylix";
  };

  config = lib.mkIf cfg.activar {
    stylix = {
      targets = {
        dunst.enable = false;
        hyprland.enable = false;
        wofi.enable = false;
        neovim.enable = false;
        fish.enable = false;
      };

      fonts = {
        monospace = {
          package = pkgs.iosevka;
          name = "Iosevka";
        };
        sansSerif = {
          package = pkgs.ubuntu_font_family;
          name = "Ubuntu";
        };

        sizes = {
          applications = 11;
          terminal = 9;
          desktop = 10;
          popups = 9;
        };
      };

      iconTheme = {
        enable = true;
        package = pkgs.papirus-icon-theme;
        dark = "Papirus-Dark";
      };

      polarity = "dark";
    };
  };
}

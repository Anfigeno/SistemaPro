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
      };
      enable = true;
      base16Scheme = {
        base00 = "1e1f2a";  # base
        base01 = "242734";  # base1
        base02 = "2b2f3e";  # base2
        base03 = "313749";  # base3
        base04 = "727897";  # tope_2
        base05 = "bbc3e8";  # tope
        base06 = "d1d4ee";  # tope1
        base07 = "f9f9fb";  # tope3
        base08 = "ff5263";  # rojo
        base09 = "fc9b74";  # naranja
        base0A = "ffe780";  # amarillo
        base0B = "8eeda1";  # verde
        base0C = "6ae4fc";  # cian
        base0D = "8B93FF";  # azul
        base0E = "e882ff";  # magenta
        base0F = "ff7d81";  # rosa (como alternativo/acento extra)
      };
      fonts = {
        monospace = {
          package = pkgs.monaspace;
          name = "Monaspace Neon";
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

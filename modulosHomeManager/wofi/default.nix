{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.wofi;
in {
  options.modulosHomeManager.wofi = {
    activar = lib.mkEnableOption "Activa el módulo de wofi";
  };

  config = lib.mkIf cfg.activar {
    home.packages = with pkgs; [ wofi-emoji rofi-calc ];
    programs.wofi = {
      enable = true;
      settings = {
        width = "40%";
        height = "60%";
        prompt = "Buscar...";
        normal_window = true;
        location = "center";
        gtk-dark = true;
        allow_images = true;
        image_size = 48;
        insensitive = true;
        allow_markup = true;
        no_actions = true;
        orientation = "vertical";
        halign = "fill";
        content_halign = "fill";
      };
      style = # css
        ''
          window {
            background-color: rgba(25, 25, 33, 0.8);
            padding: 50px;
          }

          #input {
            padding: 10px 20px;
            background-color: rgba(30, 31, 42, 0.8);
            border-radius: 20px;
            margin: 20px 15px;
          }

          #input:focus {
            border-color: #ff5263;
          }

          #inner-box {
            background-color: #1e1f2a;
          }

          #img {
            margin: 10px 10px;
          }

          #entry {
            border-radius: 0;
          }

          #text:selected,
          #img:selected {
            background-color: transparent;
          }

          #entry:selected {
            background-color: #2b2f3e;
          }
        '';
    };
  };
}

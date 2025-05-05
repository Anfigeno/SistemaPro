{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.zellij;
in {
  options.modulosHomeManager.zellij = {
    activar = lib.mkEnableOption "Activa el módulo de zellij";
  };

  config = lib.mkIf cfg.activar {
    programs.zellij = {
      enable = true;
      settings = {
        theme = "mestizo-zel";
        default_shell = "fish";
        default_layout = "compact";
        pane_frames = false;
        copy_on_select = true;
        session_name = "Zel";
        attach_to_session = true;
        support_kitty_keyboard_protocol = false;

        "keybinds clear-defaults=true" = import ./atajos.nix;
        themes.mestizo-zel = import ./mestizo-zel.nix;
      };
    };
  };
}

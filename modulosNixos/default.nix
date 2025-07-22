{ pkgs, lib, config, ... }: {
  imports =
    [ ./openssh ./audio ./steam ./stylix ./gnome ./gdm ./hyprland ./gvfs ];

  config.modulosNixos = { audio.activar = lib.mkDefault true; };
}

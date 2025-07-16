{ pkgs, lib, config, ... }: {
  imports =
    [ ./openssh ./audio ./steam ./stylix ./gnome ./gdm ./hyprland ./thunar ];

  config.modulosNixos = { audio.activar = lib.mkDefault true; };
}

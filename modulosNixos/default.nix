{ pkgs, lib, config, ... }: {
  imports = [ ./openssh ./audio ./steam ./stylix ./gnome ./gdm ./hyprland ];

  config.modulosNixos = { audio.activar = lib.mkDefault true; };
}

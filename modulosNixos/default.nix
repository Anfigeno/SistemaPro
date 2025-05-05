{ pkgs, lib, config, ... }: {
  imports = [ ./flatpak ./openssh ./xdg ./audio ./steam ./stylix ];

  config.modulosNixos = { audio.activar = lib.mkDefault true; };
}

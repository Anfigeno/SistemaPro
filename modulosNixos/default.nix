{ pkgs, lib, config, ... }: {
  imports = [ ./flatpak ./openssh ./xdg ./fish ./audio ./steam ];

  config.modulosNixos = { audio.activar = lib.mkDefault true; };
}

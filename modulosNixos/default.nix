{ pkgs, lib, config, ... }: {
  imports = [ ./openssh ./xdg ./audio ./steam ./stylix ];

  config.modulosNixos = { audio.activar = lib.mkDefault true; };
}

{ pkgs, lib, config, ... }: {
  imports = [ ./openssh ./audio ./steam ./stylix ];

  config.modulosNixos = { audio.activar = lib.mkDefault true; };
}

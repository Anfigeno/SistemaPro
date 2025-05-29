{ pkgs, lib, config, ... }: {
  imports = [ ./openssh ./audio ./steam ./stylix ./gnome ];

  config.modulosNixos = { audio.activar = lib.mkDefault true; };
}

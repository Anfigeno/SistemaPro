{ pkgs, lib, config, ... }: {
  imports = [ ./openssh ./audio ./steam ./stylix ./lightdm ./hyprland ];

  config.modulosNixos = { audio.activar = lib.mkDefault true; };
}

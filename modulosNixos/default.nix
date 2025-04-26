{ pkgs, lib, config, ... }: { imports = [ ./flatpak ./openssh ./xdg ./fish ./audio];

  config.modulosNixos = {
    audio.activar = lib.mkDefault true;
  };
}

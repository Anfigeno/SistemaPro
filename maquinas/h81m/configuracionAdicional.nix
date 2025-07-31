{ inputs, config, pkgs, ... }:

{
  imports = [{
    config.modulosNixos = {
      openssh.activar = true;
      stylix.activar = true;
      gvfs.activar = true;
    };
  }];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}

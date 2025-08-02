{ inputs, config, pkgs, ... }:

{
  imports = [{
    config.modulosNixos = {
      openssh.activar = true;
      steam.activar = true;
      gdm.activar = true;
      hyprland.activar = true;
      gvfs.activar = true;
    };
  }];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  hardware = {
    graphics.enable = true;
    nvidia.modesetting.enable = true;

    bluetooth = {
      enable = true;
    };
  };

  services.blueman.enable = true;
}

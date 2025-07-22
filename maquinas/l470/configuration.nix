{ inputs, config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modulosNixos
    {
      config.modulosNixos = {
        openssh.activar = true;
        steam.activar = true;
        stylix.activar = true;
        gdm.activar = true;
        hyprland.activar = true;
        gvfs.activar = true;
      };
    }
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.anfitrion = ./home.nix;
    extraSpecialArgs = { inherit inputs; };
  };

  users.users.anfitrion = {
    isNormalUser = true;
    description = "Anfitrion";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 3d";
  };

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "l470";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Lima";

  i18n.defaultLocale = "es_PE.UTF-8";

  services.xserver.xkb = {
    layout = "latam";
    variant = "";
  };

  console.keyMap = "la-latin1";

  environment.systemPackages = with pkgs; [ home-manager ];

  # NOTA: No tocar esto
  system.stateVersion = "24.11";

  hardware = {
    graphics.enable = true;
    nvidia.modesetting.enable = true;
  };
}

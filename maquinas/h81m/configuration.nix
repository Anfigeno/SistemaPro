{ inputs, config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modulosNixos
    {
      config.modulosNixos = {
        openssh.activar = true;
        stylix.activar = true;
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

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "h81m";
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
}

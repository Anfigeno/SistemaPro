{ inputs, config, pkgs, maquina, usuario, ... }:

{
  imports = [
    ./${maquina}/hardware-configuration.nix
    ./${maquina}/configuracionAdicional.nix
    ../modulosNixos
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${usuario} = ./${maquina}/home.nix;
    extraSpecialArgs = { inherit inputs; };
  };

  users.users.${usuario} = {
    isNormalUser = true;
    description = usuario;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 3d";
  };

  networking.hostName = maquina;
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

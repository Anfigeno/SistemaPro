{ pkgs, lib, config, ... }:
let cfg = config.modulosNixos.audio;
in {
  options.modulosNixos.audio = {
    activar = lib.mkEnableOption "Activa el módulo de audio";
  };

  config = lib.mkIf cfg.activar {
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}

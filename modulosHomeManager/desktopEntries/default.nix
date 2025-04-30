{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.desktopEntries;
in {
  options.modulosHomeManager.desktopEntries = {
    activar = lib.mkEnableOption "Activa el módulo de desktopEntries";
  };

  config = lib.mkIf cfg.activar {
    xdg.desktopEntries = {
      floorpPerfiles = {
        name = "Floorp Perfiles";
        genericName = "Web Browser";
        exec = "${pkgs.floorp}/bin/floorp -p";
        terminal = false;
        icon = "floorp";
        categories = [ "Application" "Network" "WebBrowser" ];
        mimeType = [
          "text/html"
          "text/xml"
          "application/xhtml+xml"
          "application/vnd.mozilla.xul+xml"
          "x-scheme-handler/http"
          "x-scheme-handler/https"
        ];
      };
    };
  };
}

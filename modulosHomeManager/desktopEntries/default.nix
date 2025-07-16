{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.desktopEntries;
in {
  options.modulosHomeManager.desktopEntries = {
    activar = lib.mkEnableOption "Activa el módulo de desktopEntries";
  };

  config = lib.mkIf cfg.activar {
    xdg.desktopEntries = {
      neovim = {
        name = "Neovim";
        genericName = "Text Editor";
        comment = "Edit text files with Neovim";
        exec = "kitty -e nvim %F";
        icon = "nvim";
        terminal = false;
        type = "Application";
        categories = [ "Development" "TextEditor" ];
        mimeType = [
          "text/plain"
          "text/x-makefile"
          "text/x-c++hdr"
          "text/x-c++src"
          "text/x-chdr"
          "text/x-csrc"
          "text/x-java"
          "text/x-moc"
          "text/x-pascal"
          "text/x-tcl"
          "text/x-tex"
          "application/x-shellscript"
          "text/x-c"
          "text/x-c++"
          "text/x-python"
          "text/x-lua"
          "text/x-rust"
          "text/x-go"
          "text/x-javascript"
          "text/x-typescript"
          "text/html"
          "text/css"
          "text/x-yaml"
          "text/x-json"
          "text/markdown"
          "text/x-nix"
        ];
      };
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

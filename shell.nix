{ pkgs }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    lua-language-server
    stylua
    nixd
    nixfmt-classic
    nil
  ];
}

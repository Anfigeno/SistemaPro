let mestizo = import ./mestizo.nix;
in {
  oscuro = {
    base00 = mestizo.base;
    base01 = mestizo.base1;
    base02 = mestizo.base2;
    base03 = mestizo.base3;
    base04 = mestizo.tope_2;
    base05 = mestizo.tope;
    base06 = mestizo.tope1;
    base07 = mestizo.tope3;
    base08 = mestizo.rojo;
    base09 = mestizo.naranja;
    base0A = mestizo.amarillo;
    base0B = mestizo.verde;
    base0C = mestizo.cian;
    base0D = mestizo.azul;
    base0E = mestizo.magenta;
    base0F = mestizo.rosa;
  };
  claro = {
    base00 = mestizo.tope;
    base01 = mestizo.tope1;
    base02 = mestizo.tope_1;
    base03 = mestizo.tope_2;
    base04 = mestizo.base2;
    base05 = mestizo.base;
    base06 = mestizo.base_1;
    base07 = mestizo.base_2;
    base08 = mestizo.rojo;
    base09 = mestizo.naranja;
    base0A = mestizo.amarillo;
    base0B = mestizo.verde;
    base0C = mestizo.cian;
    base0D = mestizo.azul;
    base0E = mestizo.magenta;
    base0F = mestizo.rosa;
  };
}

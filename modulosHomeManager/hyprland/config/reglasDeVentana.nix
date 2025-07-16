{ lib }:
let
  ventanasPorNombreYClase = [{
    clase = "floorp";
    titulo = "Floorp - Choose User Profile";
  }];

  ventanasPorClase = [ "io.bassi.Amberol" ];

in lib.mkMerge [
  (lib.map
    (ventana: "float, class:^(${ventana.clase})$, title:^(${ventana.titulo})$")
    ventanasPorNombreYClase)
  (lib.map (clase: "float, class:^(${clase})$") ventanasPorClase)
  [ "size 200 400, class:^(${builtins.elemAt ventanasPorClase 0})$" ]
]

{ lib }:
let
  ventanasFlotantes = {
    porNombreYClase = [{
      clase = "floorp";
      titulo = "Floorp - Choose User Profile";
    }];
    porClase = [ "io.bassi.Amberol" ];
  };
in lib.mkMerge [
  (lib.map (ventana: "float, class:${ventana.clase}, title:${ventana.titulo}")
    ventanasFlotantes.porNombreYClase)
  (lib.map (clase: "float, class:${clase}") ventanasFlotantes.porClase)
  [ "size 200 400, class:^(io.bassi.Amberol)$" ]
]

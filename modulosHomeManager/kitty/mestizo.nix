let mestizo = import ../../lib/mestizo.nix;
in {
  # Colores básicos
  background = mestizo.base;
  foreground = mestizo.tope;
  selection_background = mestizo.base3;
  selection_foreground = mestizo.tope;

  # Colores del cursor
  cursor = mestizo.tope;
  cursor_text_color = mestizo.base;

  # Color de subrayado de URL al pasar el mouse
  url_color = mestizo.tope_2;

  # Colores de bordes de ventana de Kitty
  active_border_color = mestizo.base3;
  inactive_border_color = mestizo.base1;

  # Colores de barra de título del SO
  wayland_titlebar_color = mestizo.base;
  macos_titlebar_color = mestizo.base;

  # Colores de barra de pestañas
  active_tab_background = mestizo.base;
  active_tab_foreground = mestizo.tope;
  inactive_tab_background = mestizo.base_1;
  inactive_tab_foreground = mestizo.tope_2;
  tab_bar_background = mestizo.base_1;

  # Los 16 colores del terminal
  # normales
  color0 = mestizo.base;
  color1 = mestizo.rojo;
  color2 = mestizo.verde;
  color3 = mestizo.amarillo;
  color4 = mestizo.azul;
  color5 = mestizo.magenta;
  color6 = mestizo.cian;
  color7 = mestizo.tope;

  # brillantes
  color8 = mestizo.base3;
  color9 = mestizo.rojo;
  color10 = mestizo.verde;
  color11 = mestizo.amarillo;
  color12 = mestizo.azul;
  color13 = mestizo.magenta;
  color14 = mestizo.cian;
  color15 = mestizo.tope3;

  # colores extendidos base16
  color16 = mestizo.naranja;
  color17 = mestizo.rosa;
  color18 = mestizo.base1;
  color19 = mestizo.base2;
  color20 = mestizo.tope_2;
  color21 = mestizo.tope1;
}

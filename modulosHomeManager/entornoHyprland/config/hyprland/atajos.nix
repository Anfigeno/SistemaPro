{ pkgs }:
let audio = import ./scripts/audio.nix { inherit pkgs; };
in [
  "SUPER, RETURN, exec, kitty"
  "SUPER, SPACE, exec, ulauncher-toggle"

  # Esencial
  "SUPER SHIFT, r, exec, hyprctl reload"
  "SUPER SHIFT, c, forcekillactive"
  "SUPER SHIFT, F, exec, hyprctl dispatch togglefloating && hyprctl dispatch centerwindow"
  "SUPER, F, fullscreen"

  # Cambiar entre ventanas
  "SUPER, h, movefocus, l"
  "SUPER, j, movefocus, d"
  "SUPER, k, movefocus, u"
  "SUPER, l, movefocus, r"

  # Volumen
  ", XF86AudioRaiseVolume, exec, ${audio}/bin/control-de-volumen aumentar"
  ", XF86AudioLowerVolume, exec, ${audio}/bin/control-de-volumen reducir"
  ", XF86AudioMute, exec, ${audio}/bin/control-de-volumen silenciar"

  # Multimedia
  ", XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
  ", XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next"
  ", XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous"
  ", XF86AudioStop, exec, ${pkgs.playerctl}/bin/playerctl stop"

  # Brillo
  ", XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl set +10%"
  ", XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 10%-"

  # Ajustar el tamaño de las ventanas
  "SUPER+ALT, h, resizeactive, -20 0"
  "SUPER+ALT, l, resizeactive, 20 0"
  "SUPER+ALT, k, resizeactive, 0 -20"
  "SUPER+ALT, j, resizeactive, 0 20"

  # Mover ventanas flotantes
  "SUPER+SHIFT, h, moveactive, -40 0"
  "SUPER+SHIFT, l, moveactive, 40 0"
  "SUPER+SHIFT, k, moveactive, 0 -40"
  "SUPER+SHIFT, j, moveactive, 0 40"

  # Intercambiar ventanas de lugar
  "SUPER+SHIFT, h, swapwindow, l"
  "SUPER+SHIFT, l, swapwindow, r"
  "SUPER+SHIFT, k, swapwindow, u"
  "SUPER+SHIFT, j, swapwindow, d"
] ++
# Navegación entre escritorios
(builtins.concatLists (builtins.genList (i:
  let ws = i + 1;
  in [
    "SUPER, code:1${toString i}, workspace, ${toString ws}"
    "SUPER SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
  ]) 9))

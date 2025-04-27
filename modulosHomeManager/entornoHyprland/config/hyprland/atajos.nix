{ pkgs }:
let audio = import ./scripts/audio.nix { inherit pkgs; };
in [
  "$mod, RETURN, exec, kitty"
  "$mod, SPACE, exec, ulauncher-toggle"
  "$mod SHIFT, r, exec, hyprctl reload"
  "$mod SHIFT, q, forcekillactive"

  # Cambiar entre ventanas
  "$mod, h, movefocus, l"
  "$mod, j, movefocus, d"
  "$mod, k, movefocus, u"
  "$mod, l, movefocus, r"

  # Volumen
  ", XF86AudioRaiseVolume, exec, ${audio}/bin/control-de-volumen aumentar"
  ", XF86AudioLowerVolume, exec, ${audio}/bin/control-de-volumen reducir"
  ", XF86AudioMute, exec, ${audio}/bin/control-de-volumen silenciar"

  # Multimedia
  ", XF86AudioPlay, exec, playerctl play-pause"
  ", XF86AudioNext, exec, playerctl next"
  ", XF86AudioPrev, exec, playerctl previous"
  ", XF86AudioStop, exec, playerctl stop"

  # Brillo
  ", XF86MonBrightnessUp, exec, brightnessctl set +10%"
  ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
] ++
# Navegación entre escritorios
(builtins.concatLists (builtins.genList (i:
  let ws = i + 1;
  in [
    "$mod, code:1${toString i}, workspace, ${toString ws}"
    "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
  ]) 9))

{ pkgs }:
let audio = import ./scripts/audio.nix { inherit pkgs; };
in [
  # Mousee
  ", mouse:274, bringactivetotop"
  "CTRL, mouse:274, killactive"
  "SUPER, mouse:272, togglefloating"

  "SUPER, RETURN, exec, kitty"
  "SUPER, SPACE, exec, wofi --show drun"
  "SUPER, e, exec, ${pkgs.xfce.thunar}/bin/thunar"
  ", Print, exec, ${pkgs.grim}/bin/grim - | ${pkgs.wl-clipboard}/bin/wl-copy"
  ''
    SHIFT, Print, exec, ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp -d)" - | ${pkgs.wl-clipboard}/bin/wl-copy''
  "SUPER, p, exec, ${pkgs.cliphist}/bin/cliphist list | ${pkgs.wofi}/bin/wofi -S dmenu | ${pkgs.cliphist}/bin/cliphist decode | ${pkgs.wl-clipboard}/bin/wl-copy"
  "SUPER, m, exec, ${pkgs.wofi-emoji}/bin/wofi-emoji"

  # Esencial
  "SUPER SHIFT, r, exec, hyprctl reload"
  "SUPER SHIFT, c, killactive"
  "SUPER SHIFT, F, togglefloating"
  "SUPER SHIFT, F, centerwindow"
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

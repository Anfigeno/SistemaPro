{ pkgs }:

pkgs.writeShellScriptBin "control-de-volumen" ''
  case "$1" in
      aumentar)
          ${pkgs.pamixer}/bin/pamixer --increase 5
          ;;
      reducir)
          ${pkgs.pamixer}/bin/pamixer --decrease 5
          ;;
      silenciar)
          ${pkgs.pamixer}/bin/pamixer --toggle-mute
          ;;
  esac

  # Obtener estado de volumen
  nivel_de_volumen=$(${pkgs.pamixer}/bin/pamixer --get-volume)
  esta_silenciado=$(${pkgs.pamixer}/bin/pamixer --get-mute)

  # Mostrar notificación
  if [ "$esta_silenciado" = "true" ]; then
      ${pkgs.dunst}/bin/dunstify -i audio-volume-muted "Volume silenciado"
  else
      ${pkgs.dunst}/bin/dunstify -i audio-volume-high "Volumen: ''${nivel_de_volumen}%"
  fi
''

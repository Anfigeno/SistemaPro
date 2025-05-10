{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.fish;
in {
  options.modulosHomeManager.fish = {
    activar = lib.mkEnableOption "Activa el módulo de fish";
  };

  config = lib.mkIf cfg.activar {
    home.packages = [ pkgs.fd ];

    programs.fish = {
      enable = true;
      plugins = [
        {
          name = "tide";
          src = pkgs.fetchFromGitHub {
            owner = "IlanCosman";
            repo = "tide";
            rev = "44c521ab292f0eb659a9e2e1b6f83f5f0595fcbd";
            sha256 = "sha256-85iU1QzcZmZYGhK30/ZaKwJNLTsx+j3w6St8bFiQWxc=";
          };
        }
        {
          name = "done";
          src = pkgs.fetchFromGitHub {
            owner = "franciscolourenco";
            repo = "done";
            rev = "eb32ade85c0f2c68cbfcff3036756bbf27a4f366";
            sha256 = "sha256-DMIRKRAVOn7YEnuAtz4hIxrU93ULxNoQhW6juxCoh4o=";
          };
        }
        {
          name = "fzf";
          src = pkgs.fetchFromGitHub {
            owner = "PatrickF1";
            repo = "fzf.fish";
            rev = "8920367cf85eee5218cc25a11e209d46e2591e7a";
            sha256 = "sha256-T8KYLA/r/gOKvAivKRoeqIwE2pINlxFQtZJHpOy9GMM=";
          };
        }
      ];
      shellInit = # fish
        ''
          set -g fish_greeting ""
          set -g tide_os_color white
          set -g tide_os_bg_color red
          set -g tide_pwd_bg_color cyan
          set -g tide_pwd_color_anchors black
          set -g tide_pwd_color black
          set -g tide_pwd_color_dirs black
          set -g tide_pwd_color_truncated_dirs black
        '';
      interactiveShellInit = # fish
        ''
          alias ls="eza --icons always --color always --long --git --no-user --no-time --no-permissions --no-filesize --all  --sort type --grid"
          alias ll="eza --icons always --color always --long --git --all --sort type"
          alias tree="eza --icons always --color always --long --git --no-user --no-time --no-permissions --no-filesize --all  --sort type --tree --git-ignore"
          set -g fzf_preview_dir_cmd eza --icons always --color always --long --git --no-user --no-time --no-permissions --no-filesize --all --sort type
        '';
    };
  };
}

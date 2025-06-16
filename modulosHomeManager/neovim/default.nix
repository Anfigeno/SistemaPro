{ pkgs, lib, config, ... }:
let
  cfg = config.modulosHomeManager.neovim;

  deGithub = { rev, ref, repo, dependencies ? [ ] }:
    pkgs.vimUtils.buildVimPlugin {
      name = "${lib.strings.sanitizeDerivationName repo}";
      src = builtins.fetchGit {
        url = "https://github.com/${repo}.git";
        ref = ref;
        rev = rev;
      };
      inherit dependencies;
    };

  mestizo-nvim = deGithub {
    rev = "87f1255f75330f0c9015abde496b733a3c45a019";
    ref = "main";
    repo = "anfigeno/mestizo.nvim";
  };

  modes-nvim = deGithub {
    rev = "7c6ca20de4c9acb22ef06074e39fd2c021b99935";
    ref = "main";
    repo = "mvllow/modes.nvim";
  };

  auto-lsp-nvim = deGithub {
    rev = "fa26c9768e111b43495faebdf1b02c91d36d6753";
    ref = "master";
    repo = "WieeRd/auto-lsp.nvim";
    dependencies = with pkgs.vimPlugins; [ nvim-lspconfig ];
  };

  tiny-code-action-nvim = deGithub {
    rev = "3204f45e4102788486f440259e09d50046081675";
    ref = "main";
    repo = "rachartier/tiny-code-action.nvim";
    dependencies = with pkgs.vimPlugins; [ plenary-nvim snacks-nvim ];
  };

  toggleterm-manager-nvim = deGithub {
    rev = "31318b85a7cc20bf50ce32aedf4e835844133863";
    ref = "main";
    repo = "ryanmsnyder/toggleterm-manager.nvim";
    dependencies = with pkgs.vimPlugins; [
      toggleterm-nvim
      telescope-nvim
      plenary-nvim
    ];
  };

  direnv-nvim = deGithub {
    rev = "a2f1264909463fd012b7b0b6bbfebc282c5d2834";
    ref = "main";
    repo = "NotAShelf/direnv.nvim";
  };

  workspaces-nvim = deGithub {
    rev = "55a1eb6f5b72e07ee8333898254e113e927180ca";
    ref = "main";
    repo = "natecraddock/workspaces.nvim";
    dependencies = with pkgs.vimPlugins; [ telescope-nvim ];
  };

  code-runner-nvim = deGithub {
    rev = "386bcaa8aa7ae8703281afce4465ecfdb7c44e65";
    ref = "main";
    repo = "CRAG666/code_runner.nvim";
  };

  symbol-usage-nvim = deGithub {
    rev = "e07c07dfe7504295a369281e95a24e1afa14b243";
    ref = "main";
    repo = "Wansmer/symbol-usage.nvim";
  };

in {
  options.modulosHomeManager.neovim = {
    activar = lib.mkEnableOption "Activa el módulo de Neovim";
  };

  config = lib.mkIf cfg.activar {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
      extraLuaConfig = builtins.readFile ./opciones.lua;
      extraPackages = with pkgs; [ fzf ripgrep xclip nodejs_20 ];
      plugins = with pkgs.vimPlugins; [
        {
          plugin = which-key-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/wich-key.lua;
        }

        {
          plugin = lazydev-nvim;
          type = "lua";
          config = # lua
            ''
              require("lazydev").setup()
            '';
        }

        {
          plugin = symbol-usage-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/symbol-usage.lua;
        }

        {
          plugin = otter-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/otter.lua;
        }

        {
          plugin = diffview-nvim;
          type = "lua";
          config = # lua
            ''require("diffview").setup()'';
        }

        {
          plugin = avante-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/avante.lua;
        }

        {
          plugin = copilot-lua;
          type = "lua";
          config = builtins.readFile ./complementos/copilot.lua;
        }

        no-neck-pain-nvim

        {
          plugin = statuscol-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/statuscol.lua;
        }

        {
          plugin = code-runner-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/code-runner.lua;
        }

        {
          plugin = workspaces-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/workspaces.lua;
        }

        {
          plugin = direnv-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/direnv.lua;
        }

        {
          plugin = markview-nvim;
          type = "lua";
          config = # lua
            ''require("markview").setup()'';
        }

        {
          plugin = nvim-ufo;
          type = "lua";
          config = builtins.readFile ./complementos/ufo.lua;
        }

        {
          plugin = tiny-code-action-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/tiny-code-action.lua;
        }

        {
          plugin = nvim-navic;
          type = "lua";
          config = builtins.readFile ./complementos/navic.lua;
        }

        {
          plugin = auto-lsp-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/auto-lsp.lua;
        }

        {
          plugin = trouble-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/trouble.lua;
        }

        {
          plugin = tiny-inline-diagnostic-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/tiny-inline-diagnostic.lua;
        }

        {
          plugin = kulala-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/kulala.lua;
        }

        {
          plugin = lualine-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/lualine.lua;
        }

        {
          plugin = tabout-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/tabout.lua;
        }

        {
          plugin = hover-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/hover.lua;
        }

        {
          plugin = nvim-notify;
          type = "lua";
          config = builtins.readFile ./complementos/notify.lua;
        }

        {
          plugin = todo-comments-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/todo-comments.lua;
        }

        {
          plugin = stay-centered-nvim;
          type = "lua";
          config = # lua
            ''require("stay-centered").setup()'';
        }

        {
          plugin = dashboard-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/dashboard.lua;
        }

        {
          plugin = satellite-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/satellite.lua;
        }

        {
          plugin = mestizo-nvim;
          config = "colorscheme mestizo";
        }

        {
          plugin = nvim-lspconfig;
          type = "lua";
          config = builtins.readFile ./lsp.lua;
        }

        cmp-nvim-lsp
        cmp-buffer
        cmp-path
        cmp-cmdline
        cmp_luasnip
        lspkind-nvim
        luasnip
        friendly-snippets
        {
          plugin = nvim-autopairs;
          type = "lua";
          config = builtins.readFile ./complementos/autopairs.lua;
        }
        {
          plugin = nvim-cmp;
          type = "lua";
          config = builtins.readFile ./complementos/cmp.lua;
        }

        nvim-treesitter.withAllGrammars

        {
          plugin = nvim-treesitter;
          type = "lua";
          config = builtins.readFile ./complementos/treesitter.lua;
        }

        scope-nvim
        {
          plugin = bufferline-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/bufferline.lua;
        }

        {
          plugin = nvim-colorizer-lua;
          type = "lua";
          config = # lua
            ''require("colorizer").setup()'';
        }

        {
          plugin = gitsigns-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/gitsigns.lua;
        }

        {
          plugin = inc-rename-nvim;
          type = "lua";
          config = # lua
            ''require("inc_rename").setup()'';
        }

        {
          plugin = mini-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/mini.lua;
        }

        {
          plugin = hlchunk-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/hlchunk.lua;
        }

        {
          plugin = modes-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/modes.lua;
        }

        {
          plugin = rainbow-delimiters-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/rainbow-delimiters.lua;
        }

        {
          plugin = telescope-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/telescope.lua;
        }

        nvim-web-devicons
        {
          plugin = neo-tree-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/neotree.lua;
        }

        {
          plugin = edgy-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/edgy.lua;
        }

        {
          plugin = toggleterm-manager-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/toggleterm-manager.lua;
        }
        {
          plugin = toggleterm-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/toggleterm.lua;
        }

        {
          plugin = neoformat;
          type = "lua";
          config = builtins.readFile ./complementos/neoformat.lua;
        }

        {
          plugin = neocord;
          type = "lua";
          config = # lua
            ''require("neocord").setup()'';
        }

        {
          plugin = noice-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/noice.lua;
        }
      ];
    };
  };
}

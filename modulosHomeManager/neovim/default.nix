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
    rev = "a7ddeae4c9e2167a040b764cae768592b48a021c";
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
in {
  options.modulosHomeManager.neovim = {
    activar = lib.mkEnableOption "Activa el módulo de Neovim";
  };

  config = lib.mkIf cfg.activar {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      extraLuaConfig = builtins.readFile ./opciones.lua;
      extraPackages = with pkgs; [ fzf ripgrep xclip ];
      plugins = with pkgs.vimPlugins; [
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
          plugin = auto-lsp-nvim;
          type = "lua";
          config = builtins.readFile ./complementos/auto-lsp.lua;
        }

        {
          plugin = trouble-nvim;
          type = "lua";
          config = # lua
            ''require("trouble").setup{}'';
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

        nvim-treesitter-context
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

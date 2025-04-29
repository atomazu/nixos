{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config;
in
{
  options.nvim = {
    enabled = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable NeoVim";
    };
  };

  config = lib.mkIf (cfg.nvim.enabled) {
    programs.nixvim = {
      enable = true;
      extraPackages = with pkgs; [
        ripgrep
        lazygit
        fd
        nixfmt-rfc-style
        gcc
        tree-sitter
        nodejs
      ];

      opts = {
        number = true;
        relativenumber = true;
        splitright = true;
        splitbelow = true;

        tabstop = 2;
        shiftwidth = 2;
        cursorline = true;
        scrolloff = 10;
        expandtab = true;
        autoindent = true;
      };

      colorschemes.catppuccin.enable = true;
      clipboard.register = "unnamedplus";

      plugins = {
        lz-n.enable = true;
        mini.enable = true;

        web-devicons.enable = true;
        snacks = {
          enable = true;
          settings = {
            bigfile.enabled = true;
            lazygit.enabled = true;
            notifier = {
              enabled = true;
              timeout = 3000;
            };
            picker = {
              enabled = true;
              use_vim_ui_select = true;
            };
            words = {
              debounce = 100;
              enabled = true;
            };
          };
        };

        lualine.enable = true;
        treesitter.enable = true;
        telescope.enable = true;
        telescope.extensions.fzf-native.enable = true;
        tmux-navigator.enable = true;

        oil.enable = true;
        nix.enable = true;
        bufferline.enable = true;
        commentary.enable = true;

        lsp-format.enable = true;
        lsp-signature.enable = true;
        lsp-status.enable = true;
        lsp = {
          enable = true;
          servers = {
            bashls.enable = true;
            clangd.enable = true;
            nixd = {
              enable = true;
            };
            pyright.enable = true;
            gopls.enable = true;
          };
        };

        cmp = {
          enable = true;
          autoEnableSources = true;
          settings = {
            sources = [
              { name = "nvim_lsp"; }
              { name = "path"; }
              { name = "buffer"; }
            ];

            mapping = {
              "<CR>" = {
                __raw = "require('cmp').mapping.confirm({ select = true })";
              };
              "<C-n>" = {
                __raw = "require('cmp').mapping.select_next_item()";
              };
              "<C-p>" = {
                __raw = "require('cmp').mapping.select_prev_item()";
              };
              "<C-e>" = {
                __raw = "require('cmp').mapping.abort()";
              };
              "<C-Space>" = {
                __raw = "require('cmp').mapping.complete()";
              };
              "<C-f>" = {
                __raw = "require('cmp').mapping.scroll_docs(4)";
              };
              "<C-b>" = {
                __raw = "require('cmp').mapping.scroll_docs(-4)";
              };
            };
          };
        };

        nvim-surround = {
          enable = true;
          settings.keymaps = {
            insert = "<C-g>s";
            insert_line = "<C-g>S";
            normal = "<leader>sa";
            normal_cur = "<leader>sl";
            normal_line = "<leader>sn";
            normal_cur_line = "<leader>sN";
            visual = "S";
            visual_line = "gS";
            delete = "<leader>sd";
            change = "<leader>sr";
            change_line = "<leader>sR";
          };
        };
        nvim-autopairs.enable = true;

        dashboard.enable = true;
        noice.enable = true;
        dressing.enable = true;
        colorizer.enable = true;
        which-key.enable = true;

        cmake-tools.enable = true;
        toggleterm = {
          enable = true;
          # FIXME
          # settings = {
          #   open_mapping = "<leader>tt";
          #   direction = "float";
          #   float_opts = {
          #     border = "curved";
          #   };
          # };
        };
      };

      keymaps = [
        {
          mode = "n";
          key = "<leader>ff";
          action = "<cmd>Telescope find_files<CR>";
          options = {
            silent = true;
            noremap = true;
            desc = "Telescope: Find Files";
          };
        }
        {
          mode = "n";
          key = "<leader>fg";
          action = "<cmd>Telescope live_grep<CR>";
          options = {
            silent = true;
            noremap = true;
            desc = "Telescope: Live Grep";
          };
        }
        {
          mode = "n";
          key = "<leader>fb";
          action = "<cmd>Telescope buffers<CR>";
          options = {
            silent = true;
            noremap = true;
            desc = "Telescope: Buffers";
          };
        }
        {
          mode = "n";
          key = "<leader>fh";
          action = "<cmd>Telescope help_tags<CR>";
          options = {
            silent = true;
            noremap = true;
            desc = "Telescope: Help Tags";
          };
        }
        {
          mode = "n";
          key = "<leader>fr";
          action = "<cmd>Telescope lsp_references<CR>";
          options = {
            silent = true;
            noremap = true;
            desc = "Telescope: LSP References";
          };
        }
        {
          mode = "n";
          key = "<leader>fs";
          action = "<cmd>Telescope lsp_document_symbols<CR>";
          options = {
            silent = true;
            noremap = true;
            desc = "Telescope: Document Symbols";
          };
        }
        {
          mode = "n";
          key = "<leader>fS";
          action = "<cmd>Telescope lsp_workspace_symbols<CR>";
          options = {
            silent = true;
            noremap = true;
            desc = "Telescope: Workspace Symbols";
          };
        }
        {
          mode = "n";
          key = "<leader>gf";
          action = "<cmd>Telescope git_files<CR>";
          options = {
            silent = true;
            noremap = true;
            desc = "Telescope: Git Files";
          };
        }
        {
          mode = "n";
          key = "<leader>gs";
          action = "<cmd>Telescope git_status<CR>";
          options = {
            silent = true;
            noremap = true;
            desc = "Telescope: Git Status";
          };
        }
      ];
    };
  };
}

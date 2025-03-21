{ pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    extraPackages = with pkgs; [
      ripgrep
      fd
      lazygit
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
          nixd.enable = true;
        };
      };

      cmp.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable = true;

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
      toggleterm.enable = true;
    };

    keymaps = [
      {
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<CR>";
        mode = "n";
        options = {
          silent = true; 
        };
      }
      {
        key = "<leader>gg";
        action = "<cmd>Snacks lazygit<CR>";
        mode = "n";
        options = {
          silent = true;
        };
      }
    ];
  };
}

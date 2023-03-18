return require("packer").startup(function()
   -- Packer can manage itself
   use "wbthomason/packer.nvim"
   use "tpope/vim-fugitive"
   use "tpope/vim-rhubarb"
   use "tpope/vim-surround"
   use "nvim-tree/nvim-web-devicons"
   -- Winbar
   use {
      "fgheng/winbar.nvim",
      config = function()
         require("winbar").setup {
            enabled = true,
            show_file_path = true,
            exclude_filetype = {
               "help",
               "startify",
               "dashboard",
               "packer",
               "neogitstatus",
               "NvimTree",
               "Trouble",
               "alpha",
               "lir",
               "Outline",
               "spectre_panel",
               "toggleterm",
               "neo-tree",
               "qf",
            },
         }
      end,
   }
   -- Colors
   use "sainnhe/everforest"
   use "sainnhe/edge"
   use "projekt0n/github-nvim-theme"
   use { "catppuccin/nvim", as = "catppuccin" }
   -- File Tree
   use {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
         "nvim-lua/plenary.nvim",
         "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
         "MunifTanjim/nui.nvim",
      },
      config = function()
         require("neo-tree").setup {
            close_if_last_window = true,
            enable_git_signs = true,
            disable_netrw = true,
            hijack_netrw = true,
            close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
            sort_case_insensitive = false, -- used when sorting files and directories in the tree
            use_default_mappings = false,
            window = {
               mappings = {
                  ["o"] = "open",
                  ["<space>"] = {
                     "toggle_node",
                     nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
                  },
                  ["<2-LeftMouse>"] = "open",
                  ["<cr>"] = "open",
                  ["<esc>"] = "revert_preview",
                  ["P"] = { "toggle_preview", config = { use_float = true } },
                  ["l"] = "focus_preview",
                  ["S"] = "open_split",
                  ["s"] = "open_vsplit",
                  -- ["S"] = "split_with_window_picker",
                  -- ["s"] = "vsplit_with_window_picker",
                  ["t"] = "open_tabnew",
                  -- ["<cr>"] = "open_drop",
                  -- ["t"] = "open_tab_drop",
                  ["w"] = "open_with_window_picker",
                  --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
                  ["C"] = "close_node",
                  ["z"] = "close_all_nodes",
                  --["Z"] = "expand_all_nodes",
                  ["a"] = {
                     "add",
                     -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
                     -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                     config = {
                        show_path = "none", -- "none", "relative", "absolute"
                     },
                  },
                  ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
                  ["d"] = "delete",
                  ["r"] = "rename",
                  ["y"] = "copy_to_clipboard",
                  ["x"] = "cut_to_clipboard",
                  ["p"] = "paste_from_clipboard",
                  ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
                  ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
                  ["q"] = "close_window",
                  ["R"] = "refresh",
                  ["?"] = "show_help",
                  ["<"] = "prev_source",
                  [">"] = "next_source",
               },
            },
            nesting_rules = {
               ["ts"] = { "spec.ts", "spec.tsx", "stories.tsx", "stories.mdx" },
               ["tsx"] = { "spec.ts", "spec.tsx", "stories.tsx", "stories.mdx" },
               ["js"] = { "d.ts" },
               ["jsx"] = { "d.ts" },
            },
            filesystem = {
               filtered_items = {
                  visible = true, -- when true, they will just be displayed differently than normal items
                  hide_dotfiles = false,
                  hide_gitignored = true,
                  hide_hidden = true, -- only works on Windows for hidden files/directories
                  hide_by_name = {
                     -- "node_modules"
                  },
                  hide_by_pattern = { -- uses glob style patterns
                     -- "*.meta",
                     -- "*/src/*/tsconfig.json",
                  },
                  always_show = { -- remains visible even if other settings would normally hide it
                     -- ".gitignored",
                  },
                  never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                     -- ".DS_Store",
                     -- "thumbs.db"
                  },
                  never_show_by_pattern = { -- uses glob style patterns
                     -- ".null-ls_*",
                  },
               },
               bind_to_cwd = true,
               cwd_target = { sidebar = "tab", current = "window" },
               follow_current_file = true, -- This will find and focus the file in the active buffer every
               -- time the current file is changed while the tree is open.
               group_empty_dirs = false, -- when true, empty folders will be grouped together
               hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
               -- in whatever position is specified in window.position
               -- "open_current",  -- netrw disabled, opening a directory opens within the
               -- window like netrw would, regardless of window.position
               -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
               use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
            },
            buffers = {
               follow_current_file = true, -- This will find and focus the file in the active buffer every
               -- time the current file is changed while the tree is open.
               group_empty_dirs = true, -- when true, empty folders will be grouped together
               show_unloaded = true,
               window = {
                  mappings = {
                     ["bd"] = "buffer_delete",
                     ["<bs>"] = "navigate_up",
                     -- ["<c-.>"] = "set_root",
                  },
               },
            },
         }
      end,
   }
   -- LSP Stuff
   use {
      "nvim-treesitter/nvim-treesitter",
      run = function()
         require("nvim-treesitter.install").update { sync_install = true, ensure_installed = "all", auto_install = true }
      end,
   }
   use { "nvim-lua/plenary.nvim" }
   use { "scalameta/nvim-metals", requires = { "nvim-lua/plenary.nvim" } }
   use {
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/plenary.nvim" } },
   }
   use "hrsh7th/cmp-nvim-lsp"
   use "hrsh7th/cmp-buffer"
   use "hrsh7th/cmp-path"
   use "hrsh7th/cmp-cmdline"
   use "hrsh7th/nvim-cmp"

   use "hrsh7th/cmp-vsnip"
   use "hrsh7th/vim-vsnip"
   use {
      "goolord/alpha-nvim",
      requires = { "nvim-tree/nvim-web-devicons" },
      config = function()
         require("alpha").setup(require("alpha.themes.dashboard").config)
      end,
   }

   use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
   }
   use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
   }
   use {
      "jose-elias-alvarez/null-ls.nvim",
      requires = { { "nvim-lua/plenary.nvim" } },
   }
   use "numToStr/Comment.nvim"
   use "L3MON4D3/LuaSnip"
   use "saadparwaiz1/cmp_luasnip"
   use {
      "windwp/nvim-autopairs",
      config = function()
         require("nvim-autopairs").setup()
      end,
   }
end)

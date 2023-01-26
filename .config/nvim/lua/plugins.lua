return require("packer").startup(function()
   -- Packer can manage itself
   use "wbthomason/packer.nvim"
   use "tpope/vim-fugitive"
   use "tpope/vim-rhubarb"
   use "tpope/vim-surround"
   -- Colors
   use "sainnhe/everforest"
   use "sainnhe/edge"
   use "projekt0n/github-nvim-theme"
   use { "catppuccin/nvim", as = "catppuccin" }
   use {
      "nvim-tree/nvim-tree.lua",
      requires = {
         "nvim-tree/nvim-web-devicons", -- optional, for file icon
      },
      config = function()
         require("nvim-tree").setup {}
      end,
   }
   -- use {
   --   'b0o/incline.nvim',
   --   config = function ()
   --     require('incline').setup()
   --   end,
   -- }
   --
   use {
      "nvim-treesitter/nvim-treesitter",
      run = function()
         require("nvim-treesitter.install").update { sync_install = true, ensure_installed = "all" }
      end,
   }
   use { "nvim-lua/plenary.nvim" }
   use { "scalameta/nvim-metals", requires = { "nvim-lua/plenary.nvim" } }
   use { "akinsho/bufferline.nvim", tag = "v3.*", requires = "kyazdani42/nvim-web-devicons" }
   use "feline-nvim/feline.nvim"
   use {
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/plenary.nvim" } },
   }
   use "hrsh7th/cmp-nvim-lsp"
   use "hrsh7th/cmp-buffer"
   use "hrsh7th/cmp-path"
   use "hrsh7th/cmp-cmdline"
   use "hrsh7th/nvim-cmp"
   use "b0o/incline.nvim"

   use "hrsh7th/cmp-vsnip"
   use "hrsh7th/vim-vsnip"

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


return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
  }
  -- use {
  --   'b0o/incline.nvim',
  --   config = function () 
  --     require('incline').setup()
  --   end,
  -- }
  --
  use {
    "nvim-lualine/lualine.nvim",
    after = "github-nvim-theme",
    config = function()
      require("lualine").setup {
        options = {
          theme = "auto", -- or you can assign github_* themes individually.
          globalstatus = true,
          component_separators = { right = '', left = '' } ,
          section_separators = { left = '', right = ''},
          -- ... your lualine config
        },
          tabline = {
            lualine_a = {'mode'},
            lualine_c = {'buffers'},
            lualine_x = {'diagnostics', 'fileformat', 'filetype'},
            lualine_y = {},
            lualine_z = {'tabs'}
          },
          sections = {},
          inactive_sections = {},
      }
    end
  }
  use 'folke/tokyonight.nvim'
  -- use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use {
    'williamboman/nvim-lsp-installer',
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }
  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'navarasu/onedark.nvim'
  use 'numToStr/Comment.nvim'
  use 'sainnhe/edge'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use "projekt0n/github-nvim-theme"
  use {
    'windwp/nvim-autopairs',
    config = function() require'nvim-autopairs'.setup() end
  }

end)


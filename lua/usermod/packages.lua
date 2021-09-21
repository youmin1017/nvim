local fn = vim.fn
local cmd = vim.cmd
local set = vim.opt

vim.g.mapleader = ';'

set.number = true 

cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer itself
  use {'wbthomason/packer.nvim', opt = true}
  
  -- LSP
  use 'neovim/nvim-lspconfig'
  use {
    'ojroques/nvim-lspfuzzy',
    requires = {
      {'junegunn/fzf'},
      {'junegunn/fzf.vim'},  -- to enable preview (optional)
    },
  }
    -- Completion
  use 'nvim-lua/completion-nvim'
    -- Signature
  use {
    "ray-x/lsp_signature.nvim",
  }

  -- Colorscheme
  use 'navarasu/onedark.nvim'

  -- Status Line
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    -- your statusline
    config = function() require'usermod.configures.statusline' end,
    -- some optional icons
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Navigation
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'windwp/nvim-ts-autotag'
    }
  }
  use { -- File Exploder 
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use { -- Fuzzy finder
    'nvim-telescope/telescope.nvim',
    config = function() require('usermod.configures.telescope') end,
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { -- Smoothie
    'psliwka/vim-smoothie'
  }

  -- Comment
  use 'tpope/vim-commentary'
  
  -- Toggleterm
  use {"akinsho/toggleterm.nvim"}

  -- Indent Line
  use { 
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('usermod.configures.indent-line') end,
  } 

  -- Auto Pair
  use 'jiangmiao/auto-pairs'
  
  -- Misc
  use 'kyazdani42/nvim-web-devicons'

end)

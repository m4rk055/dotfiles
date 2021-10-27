vim.cmd([[packadd packer.nvim]])

require('packer').startup(function(use)

  use({ 'wbthomason/packer.nvim', opt = true })

  use 'nvim-lua/plenary.nvim'

  use 'joshdick/onedark.vim'

  use 'wfxr/minimap.vim'

  use 'Yggdroot/indentLine'

  use 'romgrk/barbar.nvim'

  use 'kyazdani42/nvim-web-devicons'
  
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'nvim-telescope/telescope.nvim'
  
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-vsnip' },
      { 'hrsh7th/vim-vsnip' },
    },
  })

  use 'kyazdani42/nvim-tree.lua'

  use 'mfussenegger/nvim-dap'
  
  use 'scalameta/nvim-metals'

  -- use {
  --   'nvim-treesitter/nvim-treesitter',
  --   run = ':TSUpdate'
  -- }
  -- use({ "nvim-treesitter/playground" })
end)


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('thomas.lazy',{
  change_detection = {
    notify = false
  }
})

--[[
require("lazy").setup({
  'thomas.two',
  'airblade/vim-gitgutter',
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    cmd = 'colorscheme rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
      require('trouble').setup {
        icons = false
      }
    end
  },

}, {})
--]]

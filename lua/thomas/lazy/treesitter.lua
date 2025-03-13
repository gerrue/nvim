return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function ()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "typescript", "javascript", "java", "python", "vim", "lua", "vimdoc", "json" },
        sync_install = false,
        indent = {
          disable = true
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { 'markdown' },
        }
      })
    end
  },
}

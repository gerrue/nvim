return {
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function ()
      require('nvim-surround').setup({
        keymaps = {
          visual_line = '<leader>gs'
        },
      })
    end
  }
}

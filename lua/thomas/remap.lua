vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.api.nvim_set_keymap('n', '<leader>jj', '<C-w>j', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>kk', '<C-w>k', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>hh', '<C-w>h', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>ll', '<C-w>l', { noremap=true })
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function ()
    vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
  end
})

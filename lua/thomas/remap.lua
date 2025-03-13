vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>vn', vim.cmd.noh)
vim.keymap.set("i", '<Tab>', function()
  if require("copilot.suggestion").is_visible() then
    require("copilot.suggestion").accept()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
  end
end, {
  silent = true,
})
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
vim.api.nvim_set_keymap('n', '<leader>jj', '<C-w>j', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>kk', '<C-w>k', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>hh', '<C-w>h', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>ll', '<C-w>l', { noremap=true })
vim.api.nvim_set_keymap('v', '<leader>yy', '"+y', { noremap=true })
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function ()
    vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
  end
})

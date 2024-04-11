require('thomas.remap')
require('thomas.lazy_init')

vim.cmd([[
  set tabstop=2 softtabstop=2 shiftwidth=2
  set expandtab
  set number ruler rnu
  set autoindent smartindent
  syntax on
  inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
  inoremap <silent><expr> <cr> "\<c-g>u\<CR>"
]])

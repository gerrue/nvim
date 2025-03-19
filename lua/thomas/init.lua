require('thomas.remap')
require('thomas.lazy_init')

vim.cmd([[
  set tabstop=2 softtabstop=2 shiftwidth=2
  set expandtab
  set number ruler rnu
  set autoindent smartindent
  set encoding=UTF-8
  set guifont=DroidSansMono_Nerd_Font:h11
  syntax on
]])
--[[
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"
]]--

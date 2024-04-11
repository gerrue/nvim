vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function (ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', function () vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'K', function () vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>vws', function () vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', '<leader>vd', function ()vim.lsp.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '<leader>ca', function () vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>rr', function () vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>rn', function () vim.lsp.buf.rename() end, opts)
    vim.keymap.set('i', '<C-h>', function () vim.lsp.buf.signature_help() end, opts)
    vim.diagnostic.config({ virtual_text = true })
  end
})

local handlers = {
  function (server_name)
    require('lspconfig')[server_name].setup({})
  end,
  ['tsserver'] = function ()
    local lspconfig = require('lspconfig')
    lspconfig.tsserver.setup({
      handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(
          vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = true
          }
        )
      },
      init_options = {
        settings = {
          diagnostics = {
            ignoreCodes = { '80005' }
          },
        }
      },
      filetypes = { 'typescript', 'javascript'},
    })
  end,
  ['vuels'] = function ()
    local lspconfig = require('lspconfig')
    lspconfig.vuels.setup({
      filetypes = {},
    })
  end,
  ['volar'] = function ()
    local lspconfig = require('lspconfig')
    lspconfig.volar.setup({
      settings = {
        volar = {
          autoClosingTags = true,
          autoCreateQuotes = true,
        }
      },
      filetypes = { 'vue' },
    })
  end
}

return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies =  {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function ()
      require("mason").setup()
      require("mason-lspconfig").setup({
        handlers = handlers,
        ensure_installed = {
          "eslint",
          "lua_ls",
          "pyright",
          "tsserver",
          "vimls",
          "volar",
        }
      })
    end
  }
}

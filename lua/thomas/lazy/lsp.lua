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
  ['ts_ls'] = function ()
    local lspconfig = require('lspconfig')
    lspconfig.ts_ls.setup({
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
      cmd = { "vls" },
      filetypes = { 'vue' },
      init_options = {
        config = {
          css = {},
          emmet = {},
          html = {
            suggest = {}
          },
          javascript = {
            format = {}
          },
          stylusSupremacy = {},
          typescript = {
            format = {}
          },
          vetur = {
            completion = {
              autoImport = true,
              tagCasing = "kebab",
              useScaffoldSnippets = true
            },
            format = {
              defaultFormatter = {
                html = "none",
                js = "prettier",
                ts = "prettier"
              },
              defaultFormatterOptions = {},
              scriptInitialIndent = false,
              styleInitialIndent = false
            },
            useWorkspaceDependencies = false,
            validation = {
              script = true,
              style = true,
              template = true,
              templateProps = true,
              interpolation = true
            },
            experimental = {
              templateInterpolationService = true
            }
          }
        }
      }
    })
  end,
  ['yamlls'] = function ()
    local lspconfig = require'lspconfig'
    lspconfig.yamlls.setup{
      yaml = {
        schemaStore = {
          enable = true
        }
      }
    }
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
          "ts_ls",
          "vimls",
          "volar",
          "yamlls",
        }
      })
    end
  }
}

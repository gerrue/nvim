return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
        },
        keymap = {
          accept = false,
        },
        filetypes = {
          lua = true,
          javascript = true,
          typescript = true,
          java = true,
          typescriptreact = true,
          javascriptreact = true,
          css = true,
          scss = true,
          html = true,
          json = true,
          yaml = true,
          graphql = true,
          vue = true,
          svelte = true,
          python = true,
          php = true,
          ruby = true,
          c = true,
          cpp = true,
          rust = true,
          go = true,
          swift = true,
          shell = true,
          sql = true,
          plaintext = false,
          markdown = false,
          dotenv = false,
          jproperties = false,
        }
      })
    end,
  }
}

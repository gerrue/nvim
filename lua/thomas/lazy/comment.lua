return {
  'echasnovski/mini.nvim',
  depends = {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {
      enable_autocmd = false
    },
  },
  branch = 'stable',
  config = function()
    require("mini.comment").setup({
      options = {
        -- Function to compute custom 'commentstring' (optional)
        custom_commentstring = function()
          return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
        end,
        -- Whether to ignore blank lines when commenting
        ignore_blank_line = false,
        -- Whether to ignore blank lines in actions and textobject
        start_of_line = false,
        -- Whether to force single space inner padding for comment parts
        pad_comment_parts = true,
      },
      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        -- Toggle comment (like `gcip` - comment inner paragraph) for both
        -- Normal and Visual modes
        -- comment = '<leader>gg',
        -- Toggle comment on current line
        comment_line = '<leader>gg',
        -- Toggle comment on visual selection
        comment_visual = '<leader>gb',
        -- Define 'comment' textobject (like `dgc` - delete whole comment block)
        -- Works also in Visual mode if mapping differs from `comment_visual`
        -- textobject = 'gc',
      },
      -- Hook functions to be executed at certain stage of commenting
      hooks = {
        -- Before successful commenting. Does nothing by default.
        pre = function() end,
        -- After successful commenting. Does nothing by default.
        post = function() end,
      },
    })
  end,
  event = 'VeryLazy',
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
}


--  config = function()
--    local prehook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
--    require("Comment").setup({
--      padding = true,
--      sticky = true,
--      ignore = "^$",
--      toggler = {
--        line = '<leader>gg',
--        block = '<leader>gb'
--      },
--      opleader = {
--        line = '<leader>gg',
--        block = '<leader>gb'
--      },
--      extra = {
--        above = '<leader>gk',
--        below = '<leader>gj',
--        eol = '<leader>gl',
--      },
--      mappings = {
--        basic = true,
--        extra = true,
--        extended = false,
--      },
--      pre_hook = prehook,
--      post_hook = nil,
--    })
--  end,
--  event = "BufReadPre",
--  lazy = false,

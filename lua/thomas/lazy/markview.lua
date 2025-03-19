return {
    "OXY2DEV/markview.nvim",
    lazy = false,

    -- For blink.cmp's completion
    -- source
    dependencies = {
        "saghen/blink.cmp",
        "ryanoasis/vim-devicons"
    },
    opts = {
      preview = {
          icon_provider = "devicons", -- "mini" or "devicons"
      }
    }
};

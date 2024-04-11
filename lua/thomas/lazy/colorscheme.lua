function ColorMyPencils(color)
  color = color or 'rose-pine'
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

return {
  {
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    config = function()
      require('tokyonight').setup({
	style = 'storm',
	transparent = true,
	terminal_colors = true,
	styles = {
	  comments = { italic = false },
	  keywords = { italic = false },
	  sidebars = 'dark',
	  floats = 'dark',
	}
      })
    end
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
	disable_background = true,
	variant = 'moon',
	dark_variant = 'moon',
	enable = {
	  terminal = true,
	  legacy_highlights = true,
	  migrations = true,
	},
	styles = {
	  bold = true,
	  italic = false,
	  transparency = true,
	}
      }
      vim.cmd('colorscheme rose-pine')
      ColorMyPencils()
    end
  },
}

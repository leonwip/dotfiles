return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "moon",
    light_style = "day",
    transparent = true,
  },
  init = function()
    vim.cmd [[ colorscheme tokyonight ]]
  end,
}

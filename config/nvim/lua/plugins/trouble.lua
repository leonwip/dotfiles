return {
  "folke/trouble.nvim",
  opts = {},
  cmd = "Trouble",
  keys = {
    {
      "<Leader>xx",
      "<Cmd>Trouble diagnostics toggle<CR>",
      desc = "Project diagnostics",
      mode = "n",
    },
    {
      "<Leader>xX",
      "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>",
      desc = "Buffer diagnostics",
      mode = "n",
    },
    {
      "<Leader>xs",
      "<Cmd>Trouble symbols toggle focus=false<CR>",
      desc = "Document symbols",
      mode = "n",
    },
    {
      "<Leader>xt",
      "<Cmd>Trouble todo toggle<CR>",
      desc = "TODOs",
      mode = "n",
    },
  },
}

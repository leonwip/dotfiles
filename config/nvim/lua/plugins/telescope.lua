return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    -- general stuff
    {
      "<Leader>ff",
      "<Cmd>Telescope find_files<CR>",
      desc = "Find file",
      mode = "n",
    },
    {
      "<Leader>ft",
      "<Cmd>Telescope live_grep<CR>",
      desc = "Live grep",
      mode = "n",
    },
    {
      "<Leader>fb",
      "<Cmd>Telescope buffers<CR>",
      desc = "Find buffer",
      mode = "n",
    },
    {
      "<Leader>fh",
      "<Cmd>Telescope help_tags<CR>",
      desc = "Find help",
      mode = "n",
    },
    {
      "<Leader>fc",
      "<Cmd>Telescope command_history<CR>",
      desc = "Command history",
      mode = "n",
    },

    -- git stuff
    {
      "<Leader>fgc",
      "<Cmd>Telescope git_commits<CR>",
      desc = "Git commits",
      mode = "n",
    },
    {
      "<Leader>fgb",
      "<Cmd>Telescope git_branches<CR>",
      desc = "Git branches",
      mode = "n",
    },
    {
      "<Leader>fgs",
      "<Cmd>Telescope git_status<CR>",
      desc = "Git status",
      mode = "n",
    },
    {
      "<Leader>fga",
      "<Cmd>Telescope git_stash<CR>",
      desc = "Git stash",
      mode = "n",
    },

    -- lsp stuff
    {
      "<Leader>fld",
      "<Cmd>Telescope lsp_document_symbols<CR>",
      desc = "Document symbols",
      mode = "n",
    },
    {
      "<Leader>flw",
      "<Cmd>Telescope lsp_workspace_symbols<CR>",
      desc = "Workspace symbols",
      mode = "n",
    },
    {
      "<Leader>flr",
      "<Cmd>Telescope lsp_references<CR>",
      desc = "References",
      mode = "n",
    },
  },
}

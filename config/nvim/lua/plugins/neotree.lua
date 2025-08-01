return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  opts = {
    sources = {
      "filesystem",
      "buffers",
      "document_symbols",
      "git_status",
    },
  },
  keys = {
    -- toggle
    {
      "<Leader>tt",
      "<Cmd>Neotree toggle<CR>",
      desc = "Toggle tree",
      mode = "n",
    },

    -- sources
    {
      "<Leader>tf",
      "<Cmd>Neotree focus filesystem<CR>",
      desc = "File system",
      mode = "n",
    },
    {
      "<Leader>tg",
      "<Cmd>Neotree focus git_status<CR>",
      desc = "Git status",
      mode = "n",
    },
    {
      "<Leader>tb",
      "<Cmd>Neotree focus buffers<CR>",
      desc = "Buffers",
      mode = "n",
    },
    {
      "<Leader>ts",
      "<Cmd>Neotree focus document_symbols<CR>",
      desc = "Document symbols",
      mode = "n",
    },

    -- reveal
    {
      "<Leader>trf",
      "<Cmd>Neotree focus filesystem reveal_force_cwd<CR>",
      desc = "Reveal in file system",
      mode = "n",
    },
    {
      "<Leader>trg",
      "<Cmd>Neotree focus git_status reveal_force_cwd<CR>",
      desc = "Reveal in Git status",
      mode = "n",
    },
    {
      "<Leader>trb",
      "<Cmd>Neotree focus buffers reveal_force_cwd<CR>",
      desc = "Reveal in buffers",
      mode = "n",
    },
  },
}

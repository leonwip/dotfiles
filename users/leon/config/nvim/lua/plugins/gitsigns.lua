return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {},
  keys = {
    -- movement
    {
      "[c",
      "<Cmd>Gitsigns prev_hunk<CR>",
      desc = "Previous hunk",
      mode = "n",
    },
    {
      "]c",
      "<Cmd>Gitsigns next_hunk<CR>",
      desc = "Next hunk",
      mode = "n",
    },
    -- staging
    {
      "<Leader>hs",
      "<Cmd>Gitsigns stage_hunk<CR>",
      desc = "Stage hunk",
      mode = "n",
    },
    {
      "<Leader>hr",
      "<Cmd>Gitsigns reset_hunk<CR>",
      desc = "Reset hunk",
      mode = "n",
    },
    {
      "<Leader>hS",
      "<Cmd>Gitsigns stage_buffer<CR>",
      desc = "Stage buffer",
      mode = "n",
    },
    {
      "<Leader>hR",
      "<Cmd>Gitsigns reset_buffer<CR>",
      desc = "Reset buffer",
      mode = "n",
    },
    -- preview
    {
      "<Leader>hp",
      "<Cmd>Gitsigns preview_hunk<CR>",
      desc = "Preview hunk",
      mode = "n",
    },
    {
      "<Leader>hi",
      "<Cmd>Gitsigns preview_hunk_inline<CR>",
      desc = "Preview hunk (inline)",
      mode = "n",
    },
    -- blame
    {
      "<Leader>hb",
      "<Cmd>Gitsigns blame<CR>",
      desc = "Blame",
      mode = "n",
    },
    {
      "<Leader>hl",
      "<Cmd>Gitsigns blame_line<CR>",
      desc = "Blame line",
      mode = "n",
    },
    {
      "<Leader>ht",
      "<Cmd>Gitsigns toggle_current_line_blame<CR>",
      desc = "Toggle line blame",
      mode = "n",
    },
    -- diff
    {
      "<Leader>hd",
      "<Cmd>Gitsigns diffthis<CR>",
      desc = "Diff this",
      mode = "n",
    },
    {
      "<Leader>hw",
      "<Cmd>Gitsigns toggle_word_diff<CR>",
      desc = "Toggle word diff",
      mode = "n",
    },
    -- qflist
    {
      "<Leader>hq",
      "<Cmd>Gitsigns setqflist<CR>",
      desc = "Buffer qflist",
      mode = "n",
    },
    {
      "<Leader>hQ",
      "<Cmd>Gitsigns setqflist all<CR>",
      desc = "Project qflist",
      mode = "n",
    },
  },
}

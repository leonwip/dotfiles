-- Window navigation (normal mode)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Window navigation (insert mode)
vim.keymap.set("i", "<C-h>", "<Esc><C-w>h", { desc = "Move to left window" })
vim.keymap.set("i", "<C-j>", "<Esc><C-w>j", { desc = "Move to below window" })
vim.keymap.set("i", "<C-k>", "<Esc><C-w>k", { desc = "Move to above window" })
vim.keymap.set("i", "<C-l>", "<Esc><C-w>l", { desc = "Move to right window" })

-- Window navigation (terminal mode)
vim.keymap.set(
    "t", "<C-h>", "<C-\\><C-n><C-w>h",
    { desc = "Move to left window" }
)
vim.keymap.set(
    "t", "<C-j>", "<C-\\><C-n><C-w>j",
    { desc = "Move to below window" }
)
vim.keymap.set(
    "t", "<C-k>", "<C-\\><C-n><C-w>k",
    { desc = "Move to above window" }
)
vim.keymap.set(
    "t", "<C-l>", "<C-\\><C-n><C-w>l",
    { desc = "Move to right window" }
)

-- Fast mode switch from terminal mode
vim.keymap.set(
    "t", "<Esc>", "<C-\\><C-n>",
    { desc = "Change to normal mode" }
)

--  Terminal split shortcuts
vim.keymap.set(
    "n", "<Leader>zh", ":split term://zsh<CR>",
    { desc = "Open ZSH in horizontal split" }
)
vim.keymap.set(
    "n", "<Leader>zv", ":vsplit term://zsh<CR>",
    { desc = "Open ZSH in vertical split" }
)

-- Move more lines up/down
vim.keymap.set("n", "J", "10j", { desc = "Move 10 lines down" })
vim.keymap.set("n", "K", "10k", { desc = "Move 10 lines up" })

-- Stay in visual mode after indent
vim.keymap.set("v", "<", "<gv", { desc = "Decrement indent" })
vim.keymap.set("v", ">", ">gv", { desc = "Increment indent" })

return {
    "mbbill/undotree",
    lazy = false,
    config = function()
        -- vertical split on right
        vim.g.undotree_WindowLayout = 3
        -- width of undo pane
        vim.g.undotree_SplitWidth = 40
        -- focus undo pane on toggle
        vim.g.undotree_SetFocusWhenToggle = 1
        -- auto open diff pane
        vim.g.undotree_DiffAutoOpen = 1
    end,
    keys = {
        {
            "<Leader>u",
            "<Cmd>UndotreeToggle<CR>",
            desc = "Undo-tree panel",
            mode = "n",
        },
    },
}

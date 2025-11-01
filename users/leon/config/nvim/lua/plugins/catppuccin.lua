return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        float = { transparent = true },
        dim_inactive = { enabled = true },
        integrations = {
            gitsigns = true,
            neotree = true,
            cmp = true,
            telescope = { enabled = true },
            lsp_trouble = true,
            which_key = true,
        },
    },
    init = function()
        vim.cmd [[ colorscheme catppuccin-mocha ]]
    end,
}

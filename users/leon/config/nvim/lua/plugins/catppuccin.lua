return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        auto_integrations = true,
        transparent_background = true,
        float = {
            transparent = true,
        },
    },
    init = function()
        vim.cmd [[ colorscheme catppuccin-mocha ]]
    end,
}

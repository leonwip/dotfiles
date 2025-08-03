return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "helix",
        icons = {
            rules = {
                { plugin = "gitsigns.nvim", cat = "filetype", name = "git" },
                { plugin = "neo-tree.nvim", icon = "󰙅", color = "green" },
                { plugin = "trouble.nvim", icon = "", color = "red" },
                { plugin = "twilight.nvim", icon = "", color = "yellow" },
                { plugin = "undotree", icon = "", color = "blue" },
            },
        },
        spec = {
            { "<Leader>f", group = "Telescope" },
            { "<Leader>h", group = "Gitsigns" },
            {
                "<Leader>l",
                group = "LSP",
                icon = { icon = "", color = "orange" },
            },
            {
                "<Leader>t",
                group = "Neo-tree",
                icon = { icon = "󰙅", color = "green" },
            },
            {
                "<Leader>x",
                group = "Trouble",
                icon = { icon = "", color = "red" },
            },
        },
    },
}

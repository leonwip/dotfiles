return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    opts = {
        highlight = { enable = true },
        incremental_selection = { enable = true },
        additional_vim_regex_highlighting = false,
        indent = { enable = true },
    },
}

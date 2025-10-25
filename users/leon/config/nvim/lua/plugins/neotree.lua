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
        -- use neotree as netrw
        filesystem = {
            hijack_netrw_behavior = "open_current",
        },
    },
    keys = {
        -- toggle side pane
        {
            "<Leader>tt",
            "<Cmd>Neotree position=left source=last dir=./ toggle<CR>",
            desc = "Toggle tree",
            mode = "n",
        },

        -- switch between sources
        {
            "<Leader>tf",
            "<Cmd>Neotree position=current dir=./ filesystem<CR>",
            desc = "File system",
            mode = "n",
        },
        {
            "<Leader>tg",
            "<Cmd>Neotree position=current dir=./ git_status<CR>",
            desc = "Git status",
            mode = "n",
        },
        {
            "<Leader>tb",
            "<Cmd>Neotree position=current dir=./ buffers<CR>",
            desc = "Buffers",
            mode = "n",
        },
        {
            "<Leader>ts",
            "<Cmd>Neotree position=current dir=./ document_symbols<CR>",
            desc = "Document symbols",
            mode = "n",
        },

        -- reveal in specific source
        {
            "<Leader>trf",
            "<Cmd>Neotree position=left dir=./ filesystem reveal_force_cwd<CR>",
            desc = "Reveal in file system",
            mode = "n",
        },
        {
            "<Leader>trg",
            "<Cmd>Neotree position=left dir=./ git_status reveal_force_cwd<CR>",
            desc = "Reveal in Git status",
            mode = "n",
        },
        {
            "<Leader>trb",
            "<Cmd>Neotree position=left dir=./ buffers reveal_force_cwd<CR>",
            desc = "Reveal in buffers",
            mode = "n",
        },
    },
}

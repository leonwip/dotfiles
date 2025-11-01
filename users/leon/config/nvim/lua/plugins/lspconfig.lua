return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        vim.lsp.enable("clangd")
        vim.lsp.enable("lua_ls")
        vim.lsp.enable("rust_analyzer")
        vim.lsp.enable("marksman")
        vim.lsp.enable("nixd")
    end,
    keys = {
        {
            "<Leader>li",
            function()
                vim.lsp.buf.incoming_calls()
            end,
            mode = { "n" },
            desc = "Incoming calls",
        },
        {
            "<Leader>lo",
            function()
                vim.lsp.buf.outgoing_calls()
            end,
            mode = { "n" },
            desc = "Outgoing calls",
        },
        {
            "<Leader>ld",
            function()
                vim.lsp.buf.definition()
            end,
            mode = { "n" },
            desc = "Definition",
        },
        {
            "<Leader>lr",
            function()
                vim.lsp.buf.references()
            end,
            mode = { "n" },
            desc = "References",
        },
        {
            "<Leader>lh",
            function()
                vim.lsp.buf.hover()
            end,
            mode = { "n" },
            desc = "Hover",
        },
        {
            "<Leader>ls",
            function()
                vim.lsp.buf.signature_help()
            end,
            mode = { "n" },
            desc = "Signature help",
        },
        {
            "<Leader>ln",
            function()
                vim.lsp.buf.rename()
            end,
            mode = { "n" },
            desc = "Rename",
        },
        {
            "<Leader>lf",
            function()
                vim.lsp.buf.format()
            end,
            mode = { "n" },
            desc = "Format",
        },
        {
            "<Leader>lc",
            function()
                vim.lsp.buf.code_action()
            end,
            mode = { "n" },
            desc = "Code action",
        },
    },
}

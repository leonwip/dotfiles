return {
    "mvllow/modes.nvim",
    tag = "v0.3.0",
    opts = {
        -- opacity for cursorline and number background
        line_opacity = 0.15,
        -- enable cursor highlights
        set_cursor = true,
        set_cursorline = true,
        -- enable line number highlights to match cursorline
        set_number = true,
        -- enable sign column highlights to match cursorline
        set_signcolumn = true,
        -- disable modes highlights for specified filetypes
        ignore = { "NvimTree", "TelescopePrompt" }
    },
}

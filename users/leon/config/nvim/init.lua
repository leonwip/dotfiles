vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable mouse support
vim.o.mouse = "a"

-- highlight search matches
vim.o.hlsearch = true

-- ignore case except if capital
vim.o.ignorecase = true
vim.o.smartcase = true

-- dialog instead of failing
vim.o.confirm = true

-- highlight matching braces
vim.o.showmatch = true

-- show line numbers
vim.o.number = true
-- highlight current line
vim.o.cursorline = true
-- use relative numbers
vim.o.relativenumber = true

-- backspace over everything
vim.o.backspace = "indent,eol,start"

-- wrap long lines
vim.o.wrap = true
-- highlighting column 80
vim.o.colorcolumn = "80"

-- keep 8 rows when scrolling
vim.o.scrolloff = 8

-- we'll use treesitter for syntax highlighting
vim.o.syntax = "off"

vim.o.autoindent = true
vim.o.smartindent = true

-- indent using 4 spaces
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- show whitespaces (depending on indent)
vim.o.list = true
vim.api.nvim_create_autocmd(
    { "BufEnter", "OptionSet" },
    {
        callback = function(args)
            if args.event == "BufEnter" or args.match == "shiftwidth" then
                local sw = vim.bo[args.buf].shiftwidth
                if sw == 2 then
                    vim.opt_local.listchars = {
                        tab = "│—",
                        lead = "‧",
                        trail = "‧",
                        leadmultispace = "│‧",
                        extends = "»",
                        precedes = "«",
                    }
                elseif sw == 4 then
                    vim.opt_local.listchars = {
                        tab = "│—",
                        lead = "‧",
                        trail = "‧",
                        leadmultispace = "│‧‧‧",
                        extends = "»",
                        precedes = "«",
                    }
                end
            end
        end,
    }
)

require("config.lazy")
require("config.keymap")

-- TODO: clean up treesitter config
require "nvim-treesitter.configs".setup {
    ensure_installed = {
        "bash", "css", "csv", "diff", "git_config", "git_rebase",
        "gitattributes", "gitcommit", "gitignore", "html", "json", "kconfig",
        "python", "xml", "yaml", "javascript", "typescript", "jinja",
        "jinja_inline", "c", "cpp", "cmake", "lua", "vim", "vimdoc",
        "markdown", "markdown_inline", "rust", "toml",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

vim.wo.foldenable = false
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

-- Automatically enter insert mode on new terminal buffer
vim.api.nvim_create_autocmd(
    "TermOpen",
    {
        pattern = "*",
        command = "startinsert",
    }
)

-- Mark prompts in sign column
vim.api.nvim_create_autocmd(
    "TermOpen",
    {
        command = "setlocal signcolumn=auto",
    }
)
local ns = vim.api.nvim_create_namespace("my.terminal.prompt")
vim.api.nvim_create_autocmd(
    "TermRequest",
    {
        callback = function(args)
            if string.match(args.data.sequence, '^\027]133;A') then
                local lnum = args.data.cursor[1]
                vim.api.nvim_buf_set_extmark(args.buf, ns, lnum - 1, 0, {
                    sign_text = '▶',
                    sign_hl_group = 'SpecialChar',
                })
            end
        end,
    }
)

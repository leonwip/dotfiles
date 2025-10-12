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
-- TODO: indent detection?
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- show whitespaces
vim.o.list = true
vim.o.listchars = "tab:│—,lead:‧,leadmultispace:│‧‧‧,extends:»,precedes:«"

require("config.lazy")

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

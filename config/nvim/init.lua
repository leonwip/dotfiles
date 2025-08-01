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

-- backspace over everything
vim.o.backspace = "indent,eol,start"

-- wrap long liness
vim.o.wrap = true

-- we'll use treesitter for syntax highlighting
vim.o.syntax = "off"

vim.o.autoindent = true
vim.o.smartindent = true

-- TODO: indent detection
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2

vim.o.list = true
vim.o.listchars = "tab:>·,space:·"
-- TODO: show indent for spaces

require("config.lazy")

-- TODO: clean up treesitter config
require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash", "css", "csv", "diff", "git_config", "git_rebase",
    "gitattributes", "gitcommit", "gitignore", "html", "json",
    "kconfig", "python", "xml", "yaml",
    "javascript", "jinja", "jinja_inline", "c", "cpp", "cmake",
    "lua", "vim", "vimdoc", "markdown", "markdown_inline",
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

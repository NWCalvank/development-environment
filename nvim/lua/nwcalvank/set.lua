-- Fat cursor
vim.opt.guicursor = ""

-- Numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Leave space at top/bottom
vim.opt.scrolloff = 8

-- Prevent wrapping
vim.opt.wrap = false

-- Default whitespace
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Search highlighting
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Set colorscheme
vim.opt.termguicolors = true
vim.cmd [[colorscheme carbonfox]]

-- Format on save
-- TODO: Update LSP to respect Prettier/ESLintrc to support all languages
vim.cmd [[autocmd BufWritePre *.rs lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.format()]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

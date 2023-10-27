-- Set highlight on search
vim.o.hlsearch = false

-- Disable comment continuation
vim.opt.formatoptions:remove {"r", "c", "o"}
vim.cmd([[autocmd BufEnter * set formatoptions-=cro]])

-- Make line numbers default
vim.wo.number = true

vim.wo.relativenumber = true

vim.o.wrap = false

-- Enable mouse mode
vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.o.clipboard = "unnamedplus"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

vim.o.termguicolors = true

vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.ignorecase = true

vim.opt.scrolloff = 8
vim.o.sidescrolloff = 15

vim.opt.colorcolumn = "80"

-- Adding formatings
vim.g.neoformat_cpp_clangformat = {
    exe = "clang-format",
    args = {'--style="{IndentWidth: 4}"'}
}

vim.g.neoformat_c_clangformat = {
    exe = "clang-format",
    args = {'--style="{IndentWidth: 4}"'}
}

vim.g.neoformat_enabled_cpp = {"clangformat"}
vim.g.neoformat_enabled_c = {"clangformat"}

-- Map Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

-- [[ Options ]]

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Mouse Mode
vim.opt.mouse = "a"

-- Don't show mode
vim.opt.showmode = false

-- Sync Clipboards
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait
vim.opt.timeoutlen = 300

-- Configure splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = false
vim.opt.listchars = { trail = "·", nbsp = "␣" }

-- Preview substitutions live
vim.opt.inccommand = "split"

-- Show which line cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines above cursor
vim.opt.scrolloff = 10

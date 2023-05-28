local api = vim.api
local g = vim.g
local opt = vim.opt

-- Remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

opt.termguicolors = true  -- Enable colors in terminal
opt.hlsearch = true  -- Set hightlight on search
opt.number = true  -- true make line numbers default
opt.relativenumber = true -- Make relative number default
opt.mouse = "a"  -- Enable the mouse
opt.breakindent = true -- Enable break indent
opt.undofile = true  -- Save undo history
opt.ignorecase = true -- case insensenitive searching, unless /C or capital in search
opt.smartcase = true  -- smart case
opt.updatetime = 250 -- decrease update time
opt.signcolumn = "yes" -- always show sign column
opt.clipboard = "unnamedplus" -- acccess system clipboard

-- highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]


-- Enable filetype plugins and indentation
vim.cmd('filetype plugin indent on')

-- Set indentation options
vim.opt.expandtab = true  -- On pressing tab, insert spaces
vim.opt.tabstop = 2       -- Set tab width
vim.opt.softtabstop = 2   -- Set soft tab width
vim.opt.shiftwidth = 2    -- Set indent width

-- Set text width
vim.bo.textwidth = 120

-- Time in milliseconds to wait for a mapped sequence to complete.
opt.timeoutlen = 300

-- Search paths
opt.path:remove "/usr/include"
opt.path:append "**"

-- wildignore
opt.wildignorecase = true

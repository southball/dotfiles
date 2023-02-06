-- Vim settings
vim.opt.cindent = true
vim.opt.autowrite = true
vim.opt.autoindent = true
vim.opt.incsearch = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.number = true
vim.opt.errorbells = false
vim.opt.mouse = "a"
vim.opt.autoread = true
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.hidden = true
vim.cmd.syntax "on"

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "neoclide/coc.nvim", branch = "release" },
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
      require("which-key").setup()
    end
  },
  { "catppuccin/nvim", name = "catppuccin" }, 
  { "akinsho/toggleterm.nvim", config = true },
  { "phaazon/hop.nvim", config = true },
  "vim-airline/vim-airline",
  "vim-airline/vim-airline-themes",
  "tpope/vim-commentary",
  "scrooloose/nerdtree",
  "junegunn/fzf",
  "junegunn/fzf.vim",
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "wuelnerdotexe/vim-astro",
  "ap/vim-buftabline",
  "mileszs/ack.vim",
  "tpope/vim-fugitive",
  "lambdalisue/fern.vim"
})

vim.cmd.colorscheme("catppuccin-mocha")

vim.cmd("autocmd FileType fern setlocal nonumber")

-- Which key
require("which-key").register({
  b = {
    name = "Buffer",
    b = { "<cmd>Buffers<cr>", "List buffers" },
    n = { "<cmd>bnext<cr>", "Next buffer" },
    p = { "<cmd>bprev<cr>", "Previous buffer" },
    d = { "<cmd>bdelete<cr>", "Delete buffer" },
  },
  c = {
    name = "LSP",
    a = { "<Plug>(coc-codeaction)", "Code action" },
    f = { "<Plug>(coc-format)", "Format file" },
    g = { "<Plug>(coc-definition)", "Go to definition" },
    r = { "<Plug>(coc-rename)", "Rename symbol" },
  },
  f = {
    name = "File",
    c = { "<cmd>e ~/.config/nvim/init.lua<cr>", "Open config file" },
    f = { "<cmd>FZF<cr>", "Find file" },
    t = { "<cmd>Fern . -reveal=%<cr>", "Toggle file tree" },
    s = { "<cmd>w<cr>", "Save" },
    r = { "<cmd>source ~/.config/nvim/init.lua<cr>", "Reload config file" }
  },
  g = { "<cmd>Git<cr>", "Git" },
  j = { "<cmd>HopWord<cr>", "Jump to word" },
  w = {
    name = "Window",
    ["/"] = { "<cmd>vsplit<cr>", "Vertical split" },
    ["-"] = { "<cmd>split<cr>", "Horizontal split" },
    ["="] = { "<cmd>wincmd =<cr>", "Equal split" },
    h = { "<cmd>wincmd h<cr>", "Go to left" },
    j = { "<cmd>wincmd j<cr>", "Go to down" },
    k = { "<cmd>wincmd k<cr>", "Go to up" },
    l = { "<cmd>wincmd l<cr>", "Go to right" },
  },
  [" "] = { "<cmd>Maps<cr>", "Commands" },
  ["/"] = { ":Commentary<cr>", "Commentary" }
}, { prefix = "<leader>", silent = false, mode = {"n", "v"} })

-- Hop
require("hop").setup()

-- FZF
vim.g.fzf_preview_window = 'right:50%'

-- coc.nvim
vim.g.coc_global_extensions = { "coc-json", "coc-rust-analyzer", "coc-yaml", "coc-tsserver", "coc-vimlsp", "coc-sh", "coc-tailwindcss", "coc-html", "coc-css", "coc-lua", "coc-prettier" }
vim.cmd([[ inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>" ]])

-- ToggleTerm
require("toggleterm").setup()

-- Keybinds that are not yet converted to lua
vim.cmd([[
" Terminal Settings
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
tnoremap <C-w> <C-\><C-N><C-w>
augroup TerminalStuff
  au!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

" Toggleterm
nnoremap <C-Space> :ToggleTerm<CR>
tnoremap <C-Space> <C-\><C-N>:ToggleTerm<CR>

" Coc

" Quit keybinds
nnoremap q :q<CR>
nnoremap Q :q!<CR>
]])


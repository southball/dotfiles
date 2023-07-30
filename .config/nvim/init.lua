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

vim.cmd.colorscheme('desert')

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
  { "phaazon/hop.nvim", config = true }
})

vim.cmd([[
" Terminal Settings
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
tnoremap <C-w> <C-\><C-N><C-w>
augroup TerminalStuff
  au!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
]])


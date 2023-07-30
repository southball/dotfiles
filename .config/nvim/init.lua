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

vim.cmd([[
" Terminal Settings
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
tnoremap <C-w> <C-\><C-N><C-w>
augroup TerminalStuff
  au!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
]])


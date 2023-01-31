" General settings
set cindent autowrite autoindent incsearch
set tabstop=2 shiftwidth=2 softtabstop=2
set number noerrorbells 
set mouse=a autoread expandtab cursorline hidden
syntax on

" Terminal Settings
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
tnoremap <C-w> <C-\><C-N><C-w>
augroup TerminalStuff
  au!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

" Other settings
let NERDTreeShowHidden = 1

" vim-plug
let data_dir = stdpath('data') . '/site'
if empty(glob(data_dir . '/autoload/plug.vim'))
  execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir)

" Toggle terminal
Plug 'akinsho/toggleterm.nvim', {'tag': '*'}

" Airline on bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Comment out
Plug 'tpope/vim-commentary'

" File manager
Plug 'scrooloose/nerdtree'

" FZF integration
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Colorscheme / theme
Plug 'EdenEast/nightfox.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Hop to different places in file quickly
Plug 'phaazon/hop.nvim'

" LSP
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Astro language support
Plug 'wuelnerdotexe/vim-astro'

" Tab line
Plug 'ap/vim-buftabline'

" Ack
Plug 'mileszs/ack.vim'

" Git
Plug 'tpope/vim-fugitive'

" Which key
Plug 'liuchengxu/vim-which-key'

call plug#end()

" Colorscheme
colorscheme catppuccin-mocha

" which-key
let mapleader = "\<Space>"
nnoremap <silent> <leader> :<C-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<C-u>WhichKeyVisual '<Space>'<CR>
let g:which_key_map = {}

" Toggleterm
lua require("toggleterm").setup()
nnoremap <C-Space> :ToggleTerm<CR>
tnoremap <C-Space> <C-\><C-N>:ToggleTerm<CR>

" Hop
lua require'hop'.setup()

" FZF
let g:fzf_preview_window = 'right:50%'

" Coc
let g:coc_global_extensions = ["coc-json", "coc-rust-analyzer", "coc-yaml", "coc-tsserver", "coc-vimlsp", "coc-sh", "coc-tailwindcss", "coc-html", "coc-css"]
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
let g:which_key_map.c = { 'name': 'LSP' }
let g:which_key_map.c.a = ['<Plug>(coc-codeaction)', 'Code action']
let g:which_key_map.c.f = ['<Plug>(coc-format)', 'Code format']
let g:which_key_map.c.r = ['<Plug>(coc-rename)', 'Rename symbol']

" Other keybinds
let g:which_key_map.g = [':Git', 'Git']

let g:which_key_map.b = {
      \ 'name': 'Buffer',
      \ 'b': [':Buffers', 'List buffers'],
      \ 'n': [':bnext', 'Next buffer'],
      \ 'p': [':bprev', 'Previous buffer'],
      \ 'd': [':bdelete', 'Delete buffer'],
      \ }

let g:which_key_map.f = {
      \ 'name': 'Files',
      \ 'c': [':e ~/.config/nvim/init.vim', 'Open config file'],
      \ 'f': [':FZF', 'Find file'],
      \ 'r': [':source ~/.config/nvim/init.vim', 'Source current file'],
      \ 's': [':w', 'Save'],
      \ 't': [':NERDTreeToggle', 'Toggle tree']
      \ }

let g:which_key_map.j = [':HopWord', 'Hop word']

let g:which_key_map.w = {
      \ 'name': 'Window',
      \ '/': [':vsplit', 'Vertical split'],
      \ '-': [':split', 'Horizontal split'],
      \ '=': [':wincmd =', 'Equal split'],
      \ 'h': [':wincmd h', 'Go to left'],
      \ 'j': [':wincmd j', 'Go to down'],
      \ 'k': [':wincmd k', 'Go to up'],
      \ 'l': [':wincmd l', 'Go to right'],
      \ }

let g:which_key_map[' '] = [':Maps', 'Commands']

let g:which_key_map['/'] = [':Commentary', 'Commentary']
call which_key#register('<Space>', "g:which_key_map")

nnoremap q :q<CR>

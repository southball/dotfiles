" General settings
set cindent autowrite autoindent incsearch
set tabstop=2 shiftwidth=2 softtabstop=2 timeoutlen=50
set number noerrorbells 
set mouse=a autoread expandtab cursorline hidden
syntax on

" Terminal Settings
set splitbelow
tnoremap <Esc> <C-\><C-N>
tnoremap <C-w> <C-\><C-N><C-w>
augroup TerminalStuff
  au!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
set guicursor=

" Other settings
let NERDTreeShowHidden = 1

" vim-plug
let data_dir = stdpath('data') . '/site'
if empty(glob(data_dir . '/autoload/plug.vim'))
  execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir)

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

call plug#end()

" Tab
set hidden
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

" NERDTree
nmap <C-q> :NERDTreeToggle<CR>
nnoremap <C-Space> :split<CR>:terminal<CR>

" Hop
lua require'hop'.setup()
nnoremap <C-f> :HopWord<CR>

colorscheme catppuccin-mocha

" Coc
let g:coc_global_extensions = ["coc-json", "coc-rust-analyzer", "coc-yaml", "coc-tsserver", "coc-vimlsp", "coc-sh", "coc-tailwindcss", "coc-html", "coc-css"]
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
nnoremap <C-A-f> :call CocAction("format")<CR>

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

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-commentary'

Plug 'scrooloose/nerdtree'

" Plug 'Shougo/unite.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'EdenEast/nightfox.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'phaazon/hop.nvim'

call plug#end()

" NERDTree
nmap <C-p> :NERDTreeToggle<CR>
nnoremap <C-Space> :split<CR>:terminal<CR>

" Hop
lua require'hop'.setup()
nnoremap <C-f> :HopWord<CR>

colorscheme carbonfox

call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'arcticicestudio/nord-vim'
Plug 'dense-analysis/ale'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-fugitive'
Plug 'joshdick/onedark.vim'

call plug#end()

set cindent autowrite autoindent incsearch
set tabstop=2 shiftwidth=2 softtabstop=2 timeoutlen=50
set number noerrorbells 
set mouse=a autoread expandtab cursorline hidden
syntax on
nnoremap <silent> <F12> :w !clip.exe<CR><CR>
nnoremap ; :
imap jk <esc>
imap kj <esc>

" Terminal Settings
set splitbelow
tnoremap <Esc> <C-\><C-N>
tnoremap <C-w> <C-\><C-N><C-w>
augroup TerminalStuff
	au!
	autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
set guicursor=

colorscheme onedark

nnoremap <C-p> :FZF<CR>

" Use C-K to show documentation in preview window.
nnoremap <silent> <C-K> :call <SID>show_documentation()<CR>
nnoremap <silent> <C-J> :call CocAction('jumpDefinition')<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let $FZF_DEFAULT_COMMAND='fd --type f'
let g:buftabline_numbers = 1

command! -nargs=0 Prettier :CocCommand prettier.formatFile


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

" KACTL options
set cindent autowrite autoindent incsearch
set tabstop=2 shiftwidth=2 softtabstop=2 timeoutlen=50
set number noerrorbells 
sy on   |   im jk <esc>   |   im kj <esc>   |   no ; :
" Select region and then type :Hash to hash your selection.
" Useful for verifying that there aren't mistypes.
ca Hash w !cpp -dD -P -fpreprocessed \| tr -d '[:space:]' \
  \| md5sum \| cut -c-6

" Custom options
set mouse=a autoread expandtab cursorline
nnoremap <silent> <F12> :w !clip.exe<CR><CR>
nnoremap <F9> :execute '!./clip ' . expand('%:t:r')<CR>

" NeoVim Settings
set splitbelow
tnoremap <Esc> <C-\><C-N>
augroup TerminalStuff
	au!
	autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
set guicursor=

colorscheme onedark
"colorscheme nord

nnoremap <C-p> :FZF<CR>

" Use K to show documentation in preview window.
nnoremap <silent> <C-K> :call <SID>show_documentation()<CR>
nnoremap <silent> <C-J> :call CocAction('jumpDefinition')<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd BufNew,BufEnter *.cpp execute "silent! ALEDisableBuffer"
let $FZF_DEFAULT_COMMAND='fd --type f'
let g:buftabline_numbers = 1

command! -nargs=0 Prettier :CocCommand prettier.formatFile

if (g:colors_name == 'nord')
  highlight CursorLine cterm=bold ctermbg=8 ctermfg=NONE
  highlight Visual cterm=bold ctermbg=8 ctermfg=NONE
  highlight Comment ctermfg=14
endif

set nocompatible              " be iMproved, required
filetype off                  " required

if filereadable(expand("/home/bk/.vim/vundles.vim"))
	source ~/.vim/vundles.vim
	source ~/.vim/damienConway.vim
	source ~/.vim/leader.vim
endif

filetype plugin indent on    " required

set laststatus=2

set t_Co=256

let g:powerline#extensions#tabline#enabled = 1

let g:powerline#extensions#tabline#fnamemod = ':t'

" toggle invisible characters
map <F6> :set invlist!<CR>
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
" make the highlighting of tabs less annoying
highlight SpecialKey ctermbg=none 
" set showbreak=↪
let &showbreak="\u21aa "

inoremap jk <esc>
inoremap <esc> <nop>
set relativenumber
set timeoutlen=1000
set showcmd

vnoremap y myy`y
vnoremap Y myY`y


map <F5> :setlocal spell! spelllang=en_us<CR>

set background=dark
colorscheme sourcerer

"Show tab line above
set showtabline=2
hi Normal ctermbg=None
syntax enable
let g:choosewin_overlay_enable = 1

:set cursorline
:hi CursorLine cterm=NONE ctermbg=235 ctermfg=none

" Map tab and shift tab to switch buffers
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>
let g:vim_markdown_folding_disabled = 1
map <C-n> :NERDTreeToggle<CR>

"ix.io is like pastebin but better. 
:noremap <silent> <leader>i :w !ix<CR> " Undo directory

:set undofile
:set undodir=~/.vim/undodir

" For responding to emails in mutt
:nnoremap <C-S-b> :%s/BlitzKomp/squarefruitlabs.com/g<CR>

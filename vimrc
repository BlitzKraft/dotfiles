"" Vim Settings
""-------------
set nocompatible              " be iMproved, required
filetype off                  " required

source ~/.vim/vim-plugs.vim
source ~/.vim/damienConway.vim
filetype plugin indent on    " required

set laststatus=2

set t_Co=256

let g:livepreview_previewer = 'zathura'
let g:powerline#extensions#tabline#enabled = 1
let g:powerline#extensions#tabline#fnamemod = ':t'

" toggle invisible characters
map <F6> :set invlist!<CR>
set invlist
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
" make the highlighting of tabs less annoying
highlight SpecialKey ctermbg=none 
" set showbreak=↪
let showbreak="\u21aa "

inoremap jk <esc>
inoremap <esc> <nop>
set relativenumber
set nu
set timeoutlen=1000
set showcmd
set wildmenu
set foldenable
set foldlevelstart=10
set foldmethod=indent
set backspace=2

vnoremap y myy`y
vnoremap Y myY`y
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $


map <F5> :setlocal spell! spelllang=en_us<CR>
colorscheme landscape

"Show tab line above
set showtabline=2
hi Normal ctermbg=None
syntax enable
let g:choosewin_overlay_enable = 1

:set cursorline
":hi CursorLine cterm=NONE ctermbg=235 ctermfg=none

" Map tab and shift tab to switch buffers
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>
let g:vim_markdown_folding_disabled = 1

:set undofile
:set undodir=~/.vim/undodir
:nnoremap <F8> :set paste!<CR>o
:set pastetoggle=<F8>

"netrw settings
let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20

" Allow `h` and `l` to move you to previous/next line when reached
set whichwrap+=>,l
set whichwrap+=<,h
set rtp+=~/.fzf
set mouse-=a
set scrolloff=3

map <C-n> :Lexplore<CR>
" leader keys
let mapleader=","

"ix.io is like pastebin but better. 
:noremap <silent> <leader>i :w !ix<CR>
" colorscheme default
nnoremap rv :source $MYVIMRC<CR>
set novb
set vb "t_vb="
:map! <C-F> jkgUiw`]a
cmap w!! w !sudo tee > /dev/null %
setlocal cryptmethod=blowfish2

let g:indentLine_faster = 1
set splitright

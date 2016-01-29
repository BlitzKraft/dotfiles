set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'mattn/emmet-vim'
Plugin 'jdkanani/vim-material-theme'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 't9md/vim-choosewin'
Plugin 'sudar/vim-arduino-syntax'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'plasticboy/vim-markdown'

" Plugin for less (css)
Plugin 'JulesWang/css.vim'
Plugin 'genoma/vim-less'

" Plugin for perl syntax
Plugin 'vim-perl/vim-perl'
Plugin 'vim-scripts/Drawit'

" Duh!
" Plugin 'onur/vim-motivate'
" set term=xterm-256color
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
"set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
au! BufRead,BufNewFile *.scad set filetype=openscad
au! BufRead,BufNewFile *.ino,*.pde set filetype=arduino

" Enable the list of buffers
let g:powerline#extensions#tabline#enabled = 1

" Show just the filename
let g:powerline#extensions#tabline#fnamemod = ':t'

" toggle invisible characters
"set invlist
map <F6> :set invlist!<CR>
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
" make the highlighting of tabs less annoying
highlight SpecialKey ctermbg=none 
set showbreak=↪

"Use 'jk' as escape instead of escape.
inoremap jk <esc>
inoremap <esc> <nop>
set relativenumber
set timeoutlen=1000
set showcmd

map <F5> :setlocal spell! spelllang=en_us<CR>

set background=dark
colorscheme material-theme 

"Show tab line above
set showtabline=2
hi Normal ctermbg=None
syntax enable
let g:choosewin_overlay_enable = 1
"set choose win shortcut
"nmap - <Plug>(choosewin)
let mapleader=","


noremap <Leader>nP :!mpc toggle -q <CR><CR>
noremap <Leader>nn :!mpc next -q <CR><CR>
noremap <Leader>np :!mpc prev -q <CR><CR>

:set cursorline
:hi CursorLine cterm=NONE ctermbg=235 ctermfg=none

" Compile css.less to css.css
noremap <Leader>lc :!lessc css.less css.css <CR>

" Map tab and shift tab to switch buffers
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>
let g:vim_markdown_folding_disabled = 1

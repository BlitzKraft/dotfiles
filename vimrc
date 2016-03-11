set nocompatible              " be iMproved, required
filetype off                  " required

if filereadable(expand("/home/bk/.vim/vundles.vim"))
	source ~/.vim/vundles.vim
	source ~/.vim/damienConway.vim
	source ~/.vim/leader.vim
endif

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
" colorscheme material-theme 
colorscheme sourcerer

"Show tab line above
set showtabline=2
hi Normal ctermbg=None
syntax enable
let g:choosewin_overlay_enable = 1
"set choose win shortcut
"nmap - <Plug>(choosewin)


:set cursorline
:hi CursorLine cterm=NONE ctermbg=235 ctermfg=none


" Map tab and shift tab to switch buffers
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>
let g:vim_markdown_folding_disabled = 1
map <C-n> :NERDTreeToggle<CR>

" Don't do things twice. 
" :if !exists("autocommands_loaded")
" :  let autocommands_loaded = 1
" :  au ...
" :endif

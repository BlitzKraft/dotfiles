set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
au! BufRead,BufNewFile *.scad set filetype=openscad

" Enable the list of buffers
let g:powerline#extensions#tabline#enabled = 1

" Show just the filename
let g:powerline#extensions#tabline#fnamemod = ':t'

" toggle invisible characters
set invlist
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
highlight SpecialKey ctermbg=none " make the highlighting of tabs less annoying
set showbreak=↪

inoremap jk <esc>
inoremap <esc> <nop>
set relativenumber
set timeoutlen=300
set showcmd

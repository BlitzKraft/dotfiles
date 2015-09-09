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
set timeoutlen=300
set showcmd

map <F5> :setlocal spell! spelllang=en_us<CR>

"Show tab line above
set showtabline=2

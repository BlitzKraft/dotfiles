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

vnoremap y myy`y
vnoremap Y myY`y


map <F5> :setlocal spell! spelllang=en_us<CR>

set background=dark
colorscheme landscape

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

:set undofile
:set undodir=~/.vim/undodir
:nnoremap <F10> :set paste!<CR>

"netrw settings
let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4


" Allow `h` and `l` to move you to previous/next line when reached
set whichwrap+=>,l
set whichwrap+=<,h
set rtp+=~/.fzf
set mouse-=a

" Toggle Vexplore with Ctrl-n
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
" map <silent> <C-E> :call ToggleVExplorer()<CR>
map <C-n> :Vexplore<CR>
" leader keys
let mapleader=","

"ix.io is like pastebin but better. 
:noremap <silent> <leader>i :w !ix<CR> " Undo directory

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
Plug 'blitzkraft/onedark.vim', { 'for' : [] }
Plug 'blitzkraft/vim-polyglot'
Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'plasticboy/vim-markdown', { 'for' : [] }
Plug 'JulesWang/css.vim', { 'for' : ['css'] }
Plug 'mattn/emmet-vim', { 'for' : ['html', 'eruby'] }
Plug 'sudar/vim-arduino-syntax', { 'for' : ['arduino'] }
Plug 'blitzkraft/BinarySearchMove', { 'for' : [] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'itchyny/landscape.vim'
Plug 'Yggdroot/indentLine', { 'for' : ['python', 'ruby', 'haml', 'yaml'] }
Plug 'xuhdev/vim-latex-live-preview', { 'for' : 'tex' }
call plug#end()

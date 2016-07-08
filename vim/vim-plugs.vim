if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
Plug 'VundleVim/Vundle.vim'
Plug 'xero/sourcerer'
Plug 'blitzkraft/onedark.vim'
Plug 'blitzkraft/vim-polyglot'
Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'plasticboy/vim-markdown'
Plug 'JulesWang/css.vim'
Plug 'mattn/emmet-vim'
Plug 'sudar/vim-arduino-syntax'
Plug 'blitzkraft/BinarySearchMove'
Plug 'tpope/vim-vinegar'
call plug#end()

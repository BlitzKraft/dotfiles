" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"============Always load
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'jdkanani/vim-material-theme'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

"============Conditionals
Plugin 'plasticboy/vim-markdown'
Plugin 'JulesWang/css.vim'
Plugin 'genoma/vim-less'
Plugin 'mattn/emmet-vim'
Plugin 'sudar/vim-arduino-syntax'

" Hardly used.
" Plugin 'tpope/vim-rails'

" Duh!
" Plugin 'onur/vim-motivate'
" All of your Plugins must be added before the following line
call vundle#end()            " required

let mapleader=","

"ix.io is like pastebin but better. 
:noremap <silent> <leader>i :w !ix<CR> " Undo directory

noremap <Leader>nP :!mpc toggle -q <CR><CR>
noremap <Leader>nn :!mpc next -q <CR><CR>
noremap <Leader>np :!mpc prev -q <CR><CR>

" Compile css.less to css.css
noremap <Leader>lc :!lessc css.less css.css <CR>

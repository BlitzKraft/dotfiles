"" Some interesting stuff from Damien Conway
""""""""""""""""""""""""""""""""""""""""""""
"" Search improvements
set incsearch ignorecase smartcase 
"" hlsearch highlights all results
"" Cleaning up after it
nmap <silent> <BS> :nohlsearch <CR>
"" Rotate swap files every ten key strokes
set updatecount=10
"" Global search and replace shortcut
nmap S :%s//g<LEFT><LEFT>

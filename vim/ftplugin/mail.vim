setl tw=79
setl fo=aw

noremap <C-B> :%s/vbolise@gmail.com/bk@blitzkraft.me/g<CR>''
function! CheckAttach()
     let check='attached,attach,angehängt,attachment,Anhang'
     let oldPos=getpos('.')
     let ans=1
     let val = join(split(escape(check,' \.+*'), ','),'\|')
     1
     if search('\%('.val.'\)','W')
       let ans=input("Attach file?: (leave empty to abort): ", "file")
       while (ans != '')
               normal magg}-
               call append(line('.'), 'Attach: '.ans)
               redraw
           let ans=input("Attach another file?: (leave empty to abort): ", "file")
       endwhile
     endif
     exe ":write ". expand("<amatch>")
     call setpos('.', oldPos)
 endfu
 augroup script
     au!
     au BufWriteCmd,FileWriteCmd mutt* :call CheckAttach()
 augroup END

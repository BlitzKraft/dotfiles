setl tw=79
setl fo=aw

noremap <C-B> :%s/vbolise@gmail.com/bk@blitzkraft.me/g<CR>''

function! CheckAttach()
  let check='attached,attach,attachment'
  let oldPos=getpos('.')
  let ans=1
  let val = join(split(escape(check,' \.+*'), ','),'\|')
  if search('\%('.val.'\)','W')
    let ans=input("Attach file?: (leave empty to abort): ", "", "file")
    while (ans != '')
      normal gg}k
      call append(line('.'), 'Attach: '.ans)
      redraw
      let ans=input("Attach another file?: (leave empty to abort): ", "", "file")
    endwhile
  endif
  exe ":write ". expand("<amatch>")
  call setpos('.', oldPos)
endfu

augroup script
  au!
  au BufWriteCmd,FileWriteCmd mutt* :call CheckAttach()
augroup END

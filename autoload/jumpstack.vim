" ref:
"   https://github.com/fatih/vim-go/commit/80f6cf8fa443b259af8f90762ec51fadde57873e
"   https://github.com/tommcdo/vim-kangaroo/blob/master/plugin/kangaroo.vim

function! jumpstack#Push()
  if !exists('w:jumpstack')
    let w:jumpstack = []
  endif
  let entry = {
        \'line': line('.'), 
        \'col': col('.'), 
        \'path': expand('%:p'),
        \'content': getline('.')}
  let entry.info = printf("%s:%s:%s\n%s", entry.path, entry.line, entry.col, entry.content)
  if len(w:jumpstack) == 0 || 
        \ w:jumpstack[-1].path != entry.path || 
        \ w:jumpstack[-1].line != entry.line || 
        \ w:jumpstack[-1].col != entry.col
    call add(w:jumpstack, entry)
  endif
endfunction

function! jumpstack#Pop()
  if !exists('w:jumpstack') || len(w:jumpstack) == 0
    echo "jump stack empty"
    return
  endif

  let entry = remove(w:jumpstack, -1)
  let old_errorformat = &errorformat
  let &errorformat = "%A%f:%l:%c,%Z%m"
  lgetexpr entry['info']
  sil ll 1
  let &errorformat = old_errorformat
endfunction

" function! jumpstack#Show()
"   if !exists('w:jumpstack') || len(w:jumpstack) == 0
"     echo "jump stack empty"
"     return
"   endif
"   let arr = []
"   let i = len(w:jumpstack) - 1
"   while i >= 0
"     call add(arr, w:jumpstack[i].info)
"     let i -= 1
"   endwhile
" 
"   let old_errorformat = &errorformat
"   let &errorformat = "%A%f:%l:%c,%Z%m"
"   lgetexpr arr
"   lopen
"   let &errorformat = old_errorformat
" endfunction

if exists("b:did_ftplugin") | finish | endif
let b:did_ftplugin = 1
let s:keepcpo= &cpo
set cpo&vim

setlocal comments=b:#,fb:-
setlocal commentstring=#\ %s

let &cpo = s:keepcpo
unlet s:keepcpo

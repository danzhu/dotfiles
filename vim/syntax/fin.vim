if exists("b:current_syntax")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn keyword finBoolean true false

syn keyword finLet let
syn keyword finConditional if else
syn keyword finRepeat while

syn keyword finType int bool

syn match finComment "#.*$" contains=@Spell
syn match finNumber "\<\%([1-9]\d*\|0\)\>"
syn match finOperator ":*\%([*/%+-]\|\)="
syn match finOperator "[()*/%+-]"
syn match finOperator "[<>]=\?"

syn region finString start=/'/ skip=/\\'/ end=/'/
syn region finString start=/"/ skip=/\\"/ end=/"/

hi def link finComment Comment

hi def link finString String
hi def link finNumber Number
hi def link finBoolean Boolean
hi def link finFloat Float

hi def link finLet Statement
hi def link finConditional Conditional
hi def link finRepeat Repeat
hi def link finOperator Operator

hi def link finType Type

" reset
let b:current_syntax = "fin"

let &cpo = s:cpo_save
unlet s:cpo_save

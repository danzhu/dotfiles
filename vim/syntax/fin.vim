if exists("b:current_syntax")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn keyword finBoolean TRUE FALSE

syn keyword finDecl let mut var def
syn keyword finCtrlFlow break continue redo skip return
syn keyword finConditional if then elif else match
syn keyword finRepeat while do
syn keyword finOperator and or not
syn keyword finKeyword begin

syn keyword finInclude import

syn keyword finStorageClass const static
syn keyword finStructure struct enum

syn keyword finTodo TODO FIXME XXX contained

syn match finComment /#.*/ contains=@Spell,finTodo

syn match finCharacter /'\%([^\\]\|\\.\)'/ contains=finSpecialChar
syn match finLabel /'\I\i*/

syn match finDelimiter /[()\[\]{},;]/

syn match finOperator /[:\.~]/
syn match finOperator /:*=/
syn match finOperator /[*/%+-<>&|]=\?/
syn match finOperator /[!=]=/

syn match finStorageClass /[!&*]\I\@=/

syn match finNumber /\%(-\?\<[1-9]\d*\|\<0\)\>/
syn match finFloat /-\?\<\%([1-9]\d*\|0\)\.\%(\d\+\>\)\?/

syn match finField /\.\@<=\<\I\i*\>/
syn match finScope /\<\I\i*\>:\@=/
syn match finFunction /\<\I\i*\>\%(\s*[{(]\)\@=/
syn match finType /\<\u\i*\>/
syn match finConstant /\<\u[A-Z0-9_]\+\>/

syn match finSpecialChar /\\./ contained

syn region finString start=/"/ skip=/\\"/ end=/"/ contains=finSpecialChar

hi def link finComment Comment

hi def link finConstant Constant
hi def link finString String
hi def link finCharacter Character
hi def link finLabel Character
hi def link finNumber Number
hi def link finBoolean Boolean
hi def link finFloat Float

hi def link finField Identifier
hi def link finFunction Function

hi def link finDecl Statement
hi def link finCtrlFlow Statement
hi def link finConditional Conditional
hi def link finRepeat Repeat
hi def link finOperator Operator
hi def link finKeyword Keyword

hi def link finInclude Include

hi def link finType Type
hi def link finStorageClass StorageClass
hi def link finStructure Structure

hi def link finScope Special
hi def link finSpecialChar SpecialChar
hi def link finDelimiter Delimiter

hi def link finTodo Todo

" reset
let b:current_syntax = "fin"

let &cpo = s:cpo_save
unlet s:cpo_save

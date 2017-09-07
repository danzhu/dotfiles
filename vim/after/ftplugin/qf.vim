setlocal foldcolumn=0
setlocal nobuflisted
setlocal nonumber
setlocal norelativenumber
setlocal textwidth=0

function! QuickfixTitle()
    return exists('w:quickfix_title') ? w:quickfix_title : ''
endfunction

let &l:statusline = ''
let &l:statusline .= ' %t '
let &l:statusline .= '%#TabLineSel# %<%(%{QuickfixTitle()} %)'
let &l:statusline .= '%='
let &l:statusline .= '%* %l / %L '

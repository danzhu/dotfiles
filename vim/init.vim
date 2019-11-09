" Initialization {{{
" Basic {{{
set nocompatible
syntax on
filetype plugin indent on
set background=dark
" }}}

" Environment variables {{{
if has('win32')
    let $CONFIG = expand($USERPROFILE . '/AppData/Local')
elseif empty($XDG_CONFIG_HOME)
    let $CONFIG = expand('~/.config')
else
    let $CONFIG = expand($XDG_CONFIG_HOME)
endif

" Vim directory
if has('nvim')
    let $VIMDIR = $CONFIG . '/nvim'
    let $VIMRC = $VIMDIR . '/init.vim'
else
    let $VIMDIR = expand('~/.vim')
    let $VIMRC = expand('~/.vimrc')
endif
" }}}
" }}}

" Functions {{{
function! VMovement(key) " {{{
    " line-wise movement only when number is given
    return (v:count == 0 ? 'g' : '') . a:key
endfunction "}}}

function! HMovement(key) " {{{
    " screen movement only when wrap
    return (&wrap ? 'g' : '') . a:key
endfunction " }}}

function! SyntaxInfo() " {{{
    let id = synID(line('.'), col('.'), 1)
    exec 'hi ' . synIDattr(id, 'name')

    let tr = synIDtrans(id)
    exec 'hi '. synIDattr(tr, 'name')
endfunction " }}}

function! Write() " {{{
    if &buftype == ''
        return ":\<C-U>update\<CR>"
    endif

    return "\<CR>"
endfunction " }}}

function! LastUpdated() " {{{
    let time = getftime(expand('%:p'))
    let date = '%Y%m%d'

    if time < 0
        " no date info available
        return ''
    elseif strftime(date, time) == strftime(date, localtime())
        " same date, display time
        return strftime('%I:%M %p', time)
    else
        " different date, display date
        return strftime('%Y %m-%d', time)
    endif
endfunction " }}}

function! Map(bang, args) " {{{
    " find the first whitespace, which separates modes from the command
    let idx = match(a:args, '\s')
    if idx >= 0
        " a key sequence given, call the map commands
        let modes = strpart(a:args, 0, idx)
        let cmd = (a:bang ? 'map' : 'noremap') . strpart(a:args, idx)
    else
        " no key sequence given, show all mappings for the modes
        let modes = a:args
        let cmd = 'map'
    endif

    for md in split(modes, '\zs')
        exec md . cmd
    endfor
endfunction " }}}

function! EscapeMagic(text) " {{{
    return substitute(a:text, '\.\|\*\|\\\|\[\|\^\|\$', '\\\0', 'g')
endfunction " }}}

function! FoldText() " {{{
    let text = getline(v:foldstart)

    " expand tabs
    let res = repeat(' ', &tabstop)
    let text = substitute(text, '\t', res, 'g')

    " remove commentstring
    if !empty(&commentstring)
        let pat = substitute(EscapeMagic(&commentstring), '%s', ' *\\|', '')
        let text = substitute(text, pat, '', 'g')
    endif

    " remove fold markers
    if &foldmethod == 'marker'
        let pat = substitute(EscapeMagic(&foldmarker), ',', '\\|', '')
        let pat = '\(' . pat . '\)\d*'
        let text = substitute(text, pat, '', 'g')
    endif

    " remove trailing whitespace when line not empty
    if !(text =~ '^\s*$')
        let text = substitute(text, '\s*$', ' ', '')
    endif

    return text
endfunction " }}}

function! BufName(nr) " {{{
    let name = bufname(a:nr)

    let name = fnamemodify(name, ':t')

    if name == ''
        let name = '[No Name]'
    endif

    return name
endfunction " }}}

function! TabInfo() " {{{
    return '%f'
endfunction " }}}

function! SwitchBuffer(id, clicks, buttons, mods) " {{{
    exec 'buffer ' . a:id
endfunction " }}}

function! TabLine() " {{{
    let line = '%#StatusLine#'

    " if there are more than 1 tab
    if tabpagenr('$') > 1
        let line .= ' tab '

        " for each tab
        for i in range(1, tabpagenr('$'))
            let line .= i == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'
            let line .= '%' . i . 'T '

            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)

            let mod = ''

            if len(buflist) > 1
                " number of buffers in tab
                let mod .= string(len(buflist))
            endif

            for buf in buflist
                " add '+' if modified
                if getbufvar(buf, '&modified')
                    let mod .= '+'
                    break
                endif
            endfor

            if mod != ''
                let line .= mod . ' '
            endif

            let line .= '%{BufName(' . buflist[winnr - 1] . ')}'

            let line .= ' '
        endfor
    else
        let line .= ' buf '

        for i in range(1, bufnr('$'))
            if !buflisted(i)
                continue
            endif

            let line .= i == bufnr('%') ? '%#TabLineSel# ' : '%#TabLine# '
            if has('tablineat')
                let line .= '%' . i . '@SwitchBuffer@'
            endif

            if getbufvar(i, '&modified')
                let line .= '+ '
            endif

            let line .= '%{BufName(' . i . ')}'

            let line .= ' '
        endfor
    endif

    let line .= '%#TabLineFill#%T%=%#StatusLine#%( '
    let line .= TabInfo()
    let line .= ' %)'

    return line
endfunction " }}}

function! ClangFormat() " {{{
    let l:formatdiff = 1
    pyf /usr/share/clang/clang-format.py
endfunction " }}}
" }}}

" Commands {{{
" Map {{{
command! -nargs=1 -bang Map call Map(<bang>0, <q-args>)
" }}}

" Error {{{
command! -nargs=1 Error echohl ErrorMsg | echo <args> | echohl None
" }}}
" }}}

" Options {{{
" Variables {{{
let g:mapleader = ','

let g:c_comment_strings            = 1
let g:is_bash                      = 1
let g:java_highlight_debug         = 1
let g:java_highlight_functions     = 'style'
let g:java_highlight_java_lang_ids = 1
let g:sh_fold_enabled              = 1
let g:tex_flavor                   = 'latex'
let g:tex_fold_enabled             = 1
let g:xml_syntax_folding           = 1
let g:zsh_fold_enable              = 1

let g:markdown_fenced_languages = [
            \ 'c',
            \ 'cpp',
            \ 'haskell',
            \ 'make',
            \ 'scheme',
            \ 'sh',
            \ ]
" }}}

" Editing {{{
set autoindent                  " automatic indentation
set backspace=indent,eol,start  " backspace deletes everything
set belloff=all                 " don't ever ring the bell
set completeopt=menuone,preview " completion options
set encoding=utf-8              " UI and default encoding
set formatoptions+=j            " remove comment leader when joining lines
set hidden                      " don't unload buffer when switching to another
set mouse=a                     " enable all mouse operations
set mousefocus                  " mouse focus on hover
set mousemodel=extend           " right mouse extends selection
set nrformats=bin,hex           " zero-prefixed numbers aren't octal
set textwidth=80                " auto hard-break on 80 chars
set ttimeout                    " timeout on key codes
set ttimeoutlen=10              " short timeout for <Esc> key
set updatetime=250              " reduce update interval
" }}}

" File {{{
set autoread                " auto read file when changed
set directory=$VIMDIR/swp   " swap file directory
set history=1000            " command line history
set nobackup                " no backup file
set nowritebackup           " don't backup before writing file
set sessionoptions-=options " don't store options in session files
set swapfile                " use swap files for recovery
set undodir=$VIMDIR/undo    " undo file directory
set undofile                " permanent undo history
set undolevels=1000         " how many undos in history
set undoreload=10000        " max lines for saving undo before reload
set viewdir=$VIMDIR/view    " view file directory
set viewoptions-=options    " don't store options when :mkview
" }}}

" Ignores {{{
" patterns to ignore for wild menu
set wildignore+=*.exe
set wildignore+=*.gz
set wildignore+=*.jpg
set wildignore+=*.o
set wildignore+=*.pdf
set wildignore+=*.png
set wildignore+=*.pyc
set wildignore+=*/.git/*
set wildignore+=*/__pycache__/*
set wildignore+=*/node_modules/*
set wildignore+=Thumbs.db
set wildignore+=desktop.ini

" suffixes that have a lower priority
set suffixes+=,
set suffixes+=.aux
set suffixes+=.d
set suffixes+=.fdb_latexmk
set suffixes+=.fls
set suffixes+=.log
" }}}

" Tabs {{{
set expandtab     " expand tab to spaces
set shiftround    " align indent to multiple of shiftwidth
set shiftwidth=0  " spaces to indent / unindent, 0 to default to tabstop
set smarttab      " smarter tab insertion
set tabstop=4     " spaces of a tab
" }}}

" Display {{{
set breakindent         " display indent when lines are wrapped
set colorcolumn=+1      " highlight textwidth
set conceallevel=2      " use symbols for conceal
set cursorline          " highlight current cursor line
set display=lastline    " show partial lines when too long
set fillchars=fold:-    " text for filling separators
set foldclose=all       " auto close folds
set foldcolumn=0        " column to display folds
set foldlevel=10        " level of folds auto expanded
set foldmethod=syntax   " method to detect folds
set foldnestmax=10      " max level of folds
set foldtext=FoldText() " custom text to display on folded lines
set laststatus=2        " always show status line
set lazyredraw          " reduce redraw
set linebreak           " break at special chars
set nonumber            " line numbers
set noshowmatch         " don't jump cursor at matching brackets
set numberwidth=3       " width of line numbers
set previewheight=9     " height of preview window
set relativenumber      " relative line numbers
set ruler               " show status in status line
set scrolloff=5         " lines to always show before / after current line
set shortmess+=I        " no start screen
set showcmd             " show entered partial commands
set showmode            " show current editing mode
set showtabline=2       " always show tabline
set sidescrolloff=5     " columns to show in advance
set signcolumn=yes      " always show sign column
set spell               " enables spell check by default
set spelllang=en_ca     " use Canadian English for spell checking
set splitbelow          " open horizontal splits to the bottom
set splitright          " open new split to the right by default
set title               " change terminal titles
set ttyfast             " send more escape sequences for better display
set wildmenu            " list completions in command mode
" }}}

" Statusline and tabline {{{
let &statusline = ''
let &statusline .= ' %t '
let &statusline .= '%#TabLineSel# %<%(%{LastUpdated()} %)'
let &statusline .= '%m%r'
let &statusline .= '%='
let &statusline .= '%(%{&filetype} | %)'
let &statusline .= '%{&fileencoding}[%{&fileformat}] '
let &statusline .= '%* %3l / %L : %2v '

set tabline=%!TabLine()
" }}}

" Search {{{
set gdefault   " replace all instances by default
set ignorecase " ignore case when searching
set incsearch  " jump to nearest match when typing
set smartcase  " only lower case matches both upper and lower

" turn hlsearch on only when not set to avoid highlight after :source
if !&hlsearch
    set hlsearch " highlight all matches when searching
endif

if executable('ag')
    " use the silver searcher for grep if available
    set grepprg=ag\ --nogroup\ --nocolor
endif
" }}}

" Language mappings {{{
" set nolangremap
" set langmap+=[{}(=*)+]!;7531902468
" set langmap+=7531902468;[{}(=*)+]!
" }}}

" Neovim {{{
if has('nvim')
    set inccommand=nosplit
endif
" }}}
" }}}

" Mappings {{{
" Movement {{{
Map nx                 <C-H>   <C-W>h
Map nx                 <C-J>   <C-W>j
Map nx                 <C-K>   <C-W>k
Map nx                 <C-L>   <C-W>l
Map nx                 <C-C>   <C-W>c
Map nx          <expr> j       VMovement('j')
Map nx          <expr> k       VMovement('k')
Map nx          <expr> ^       HMovement('^')
Map nx          <expr> $       HMovement('$')
Map nx                 g$      $
Map nx                 g0      0
Map nx                 '       `
Map nx                 `       '
Map no <silent>        U       :<C-U>call search('\u')<CR>
" }}}

" Editing {{{
Map n                 S         ~hi
Map i          <expr> <Tab>     pumvisible() ? "\<C-N>" : "\<Tab>"
Map i          <expr> <S-Tab>   pumvisible() ? "\<C-P>" : ''
Map i                 <C-B>     <C-G>U<Left>
Map i                 <C-F>     <C-G>U<Right>
Map i                 <C-E>     <C-G>U<End>
Map i                 <C-U>     <C-G>u<C-U>
Map i                 <C-C>     <C-]><Esc>
Map x <silent>        s         :sort<CR>
Map x                 Y         "+y
Map x                 D         "+d
Map x                 P         "+p
Map x                 R         y/\<<C-R>"\><CR>:redraw!<CR>:%s//
" }}}

" File {{{
Map n <silent> <expr> <CR> Write()
Map n <silent>        M    :<C-U>tabnew<CR>
Map n <silent>        H    :<C-U>bprevious<CR>
Map n <silent>        L    :<C-U>bnext<CR>
Map n <silent>        -    :<C-U>bdelete<CR>
Map n <silent>        _    :<C-U>bdelete!<CR>
Map n <silent>        ZF   :<C-U>cwindow 9<CR>
" }}}

" Misc {{{
Map nx <silent> Q         :<C-U>quitall<CR>
Map n  <silent> <BS>      :<C-U>nohlsearch<CR>
Map n  <silent> <Leader>c :<C-U>call SyntaxInfo()<CR>
Map nx <silent> <Leader>f :pyf /usr/share/clang/clang-format.py<CR>
" }}}
" }}}

" Abbreviations {{{

" }}}

" Highlight links {{{
" Markdown {{{
hi link markdownCode Statement
" }}}

" HTML {{{
hi link htmlEndTag Delimiter
hi link htmlEvent PreProc
hi link htmlTag Delimiter
hi link htmlTagN htmlTagName
hi link javaScript Normal
" }}}

" JavaScript {{{
hi link javaScriptBraces Delimiter
hi link javaScriptGlobal Identifier
hi link javaScriptNull Constant
hi link javaScriptParens Delimiter
hi link javaScriptValue Constant
hi link jsFuncCall Function
" }}}

" CSS {{{
hi link cssAttrComma Delimiter
hi link cssBraces Delimiter
hi link cssFunctionComma Delimiter
" }}}

" XML {{{
hi link xmlEndTag Delimiter
hi link xmlEqual Operator
hi link xmlTag Delimiter
hi link xmlTagName Statement
" }}}

" TypeScript {{{
hi link typeScriptBraces Delimiter
hi link typeScriptLogicSymbols Operator
" }}}

" Python {{{
hi link pythonEscape SpecialChar
hi link pythonExceptions Type
" }}}

" Vim {{{
hi link vimIsCommand Statement
hi link vimSetSep Delimiter
hi link vimUserFunc Function
" }}}

" C++ {{{
hi link cppModifier StorageClass
hi link cppSTLexception Type
" }}}

" Java {{{
hi link javaBraces Delimiter
hi link javaParen Delimiter
hi link javaParen1 Delimiter
hi link javaParen2 Delimiter
" }}}
" }}}

" Special cases {{{
" Diff mode {{{
if &diff
    set number
    set nocursorline
    set norelativenumber
    set signcolumn=no
endif
" }}}

" Platform detection {{{
if has('gui_running') " GUI
    set guioptions-=L                   " left scrollbar
    set guioptions-=r                   " right scrollbar
    set guioptions-=T                   " toolbar
    set guioptions-=e                   " tabline

    set guiheadroom=0                   " don't leave space for gui
    set linespace=0                     " no space between lines

    if has('win32')
        set guifont=DejaVu_Sans_Mono:h{{font_size}}
        set guioptions-=t               " teardown menus

        set lines=50                    " height
        set columns=160                 " width
    else
        set guifont=Monospace\ {{font_size}}
    endif
elseif has('nvim') " Neovim
    " tnoremap <Esc> <C-\><C-n>

    " Cursor styling
    set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkon500-blinkoff500
elseif has('win32') " Windows
    " ignore terminal escape sequences
elseif &term=~'linux' " Linux Console
    if has('terminfo')
        set t_Co=16
        " We use the blink attribute for bright background (console_codes(4)) and the
        " bold attribute for bright foreground. The redefinition of t_AF is necessary
        " for bright "Normal" highlighting to not influence the rest.
        set t_AB=[%?%p1%{7}%>%t5%p1%{8}%-%e25%p1%;m[4%dm
        set t_AF=[%?%p1%{7}%>%t1%p1%{8}%-%e22%p1%;m[3%dm
    endif
else " Terminal Emulator
    " change cursor shape in supported terminal emulators
    if has('terminfo')
        let &t_SI = "\<Esc>[5 q" " entering insert mode
        let &t_SR = "\<Esc>[3 q" " entering replace mode
        let &t_EI = "\<Esc>[1 q" " exiting insert mode
    endif

    if has('mouse_sgr')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif
" }}}
" }}}

" Setup {{{
" Color scheme {{{
colorscheme code
" }}}

" local.vim {{{
if filereadable($VIMDIR . '/local.vim')
    source $VIMDIR/local.vim
endif
" }}}

" Plugins {{{
if filereadable($VIMDIR . '/autoload/plug.vim')
    call plug#begin()
    source $VIMDIR/plugins.vim
    call plug#end()
endif
" }}}

" Add-ons {{{
runtime! ftplugin/man.vim
" }}}

" directory {{{
if !isdirectory(&directory)
    call mkdir(&directory, 'p')
endif
" }}}

" undodir {{{
if !isdirectory(&undodir)
    call mkdir(&undodir, 'p')
endif
" }}}
" }}}

" Auto Commands {{{
augroup vimrc
    autocmd!

    " Resume last position {{{
    autocmd BufReadPost *
                \ if line("'\"") >= 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
    " }}}

    " Undo file {{{
    autocmd BufWritePre /var/tmp/* setlocal noundofile
    " }}}

    " Clang-format on save {{{
    if filereadable('/usr/share/clang/clang-format.py')
        autocmd BufWritePre *.h,*.cc,*.cpp call ClangFormat()
    endif
    " }}}
augroup END
" }}}

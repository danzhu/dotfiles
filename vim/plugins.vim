" Basic {{{
Plug 'easymotion/vim-easymotion'
" {{{
" let g:EasyMotion_leader_key = ','
" }}}

Plug 'junegunn/vim-easy-align'
" {{{
Map! nx ga <Plug>(EasyAlign)
" }}}

Plug 'haya14busa/incsearch.vim'
" {{{
Map! nxo /  <Plug>(incsearch-forward)
Map! nxo ?  <Plug>(incsearch-backward)
" Map! nxo g/ <Plug>(incsearch-stay)
" }}}

" Plug 'sickill/vim-pasta'

Plug 'terryma/vim-multiple-cursors'
" {{{
let g:multiple_cursor_exit_from_visual_mode = 0
let g:multiple_cursor_exit_from_insert_mode = 0
" }}}

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-surround'

Plug 'Shougo/unite.vim'
" {{{
Map n <silent> <Space> :<C-U>Unite -start-insert file<CR>
" }}}

" Plug 'flazz/vim-colorschemes'

Plug 'danzhu/vim-pairs'

Plug 'tpope/vim-endwise'
" }}}

" Filetypes {{{
Plug 'tpope/vim-markdown'

Plug 'mattn/emmet-vim', { 'for': 'html' }

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'pangloss/vim-javascript'

Plug 'wlangstroth/vim-racket'
" {{{
let g:markdown_fenced_languages += ['racket']
" }}}

Plug 'leafgarland/typescript-vim'

" Plug 'hdima/python-syntax'

Plug 'OrangeT/vim-csharp'

Plug 'rust-lang/rust.vim'

Plug 'vim-syntastic/syntastic'
" {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_python_checkers = ['python', 'mypy', 'pylint', 'flake8']
let g:syntastic_asm_checkers = []
" }}}
" }}}

if !has('nvim') " {{{
    " Plug 'jeaye/color_coded'
endif " }}}

if has('win32') " {{{
    Plug 'xolox/vim-misc'

    Plug 'xolox/vim-shell'
endif " }}}

if has('python') " {{{
    Plug 'sjl/gundo.vim'
    " {{{
    Map n <silent> <C-G> :<C-U>GundoToggle<CR>

    let g:gundo_close_on_revert = 1
    let g:gundo_preview_bottom  = 1
    " }}}
endif " }}}

if has('python') || has('python3') " {{{
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    " {{{
    let g:UltiSnipsExpandTrigger = '<C-j>'
    " }}}

    Plug 'Valloric/YouCompleteMe'
    " {{{
    " let g:ycm_autoclose_preview_window_after_completion = 1
    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_confirm_extra_conf                       = 0
    let g:ycm_global_ycm_extra_conf                    = $VIMDIR.'/ycm_extra_conf.py'
    let g:ycm_min_num_of_chars_for_completion          = 1
    let g:ycm_seed_identifiers_with_syntax             = 1

    let g:ycm_semantic_triggers = {
                \   'css': [ 're!^\s{4}', 're!:\s+' ],
                \ }

    Map n <silent> <Leader>g :<C-U>YcmCompleter GoTo<CR>
    " }}}
endif " }}}

if executable('git') " {{{
    Plug 'airblade/vim-gitgutter'
    " {{{
    let g:gitgutter_override_sign_column_highlight = 0

    hi link GitGutterAdd DiffAdd
    hi link GitGutterChange DiffChange
    hi link GitGutterDelete DiffDelete
    hi link GitGutterChangeDelete DiffChange
    " }}}

    Plug 'tpope/vim-fugitive'
endif " }}}

if executable('latex') " {{{
    Plug 'lervag/vimtex'
endif " }}}

if executable('ctags') " {{{
    Plug 'majutsushi/tagbar'
    " {{{
    Map n <silent> <C-T> :<C-U>TagbarToggle<CR>

    let g:tagbar_autoclose   = 1
    let g:tagbar_autopreview = 1
    let g:tagbar_sort        = 0
    " }}}
endif " }}}

if executable('tmux') " {{{
    Plug 'christoomey/vim-tmux-navigator'
endif " }}}
" }}}

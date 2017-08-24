" Interface {{{
Plug 'ctrlpvim/ctrlp.vim'
" {{{
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'

if executable('ag') " {{{
    let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'
    let g:ctrlp_use_caching  = 0
endif " }}}
" }}}

if has('python')
    Plug 'sjl/gundo.vim'
    " {{{
    Map n <silent> <C-G> :<C-U>GundoToggle<CR>

    let g:gundo_close_on_revert = 1
    let g:gundo_preview_bottom  = 1

    hi link diffAdded DiffAdd
    hi link diffRemoved DiffDelete
    " }}}
endif

if executable('git')
    Plug 'airblade/vim-gitgutter'
    " {{{
    let g:gitgutter_override_sign_column_highlight = 0

    hi link GitGutterAdd DiffAdd
    hi link GitGutterChange DiffChange
    hi link GitGutterDelete DiffDelete
    hi link GitGutterChangeDelete DiffChange
    " }}}

    Plug 'tpope/vim-fugitive'
endif

if executable('ctags')
    Plug 'majutsushi/tagbar'
    " {{{
    Map n <silent> <C-T> :<C-U>TagbarToggle<CR>

    let g:tagbar_autoclose   = 1
    let g:tagbar_autopreview = 1
    let g:tagbar_sort        = 0
    " }}}
endif

if executable('tmux')
    Plug 'christoomey/vim-tmux-navigator'
endif
" }}}

" Editing {{{
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

Plug 'tpope/vim-surround'

Plug 'danzhu/vim-pairs'

Plug 'tpope/vim-endwise'

Plug 'vim-syntastic/syntastic'
" {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['python', 'mypy', 'pylint', 'flake8']
let g:syntastic_asm_checkers = []
" }}}

Plug 'tpope/vim-unimpaired'

if !has('nvim') && has('lua') && executable('g++')
    Plug 'jeaye/color_coded'
else
    Plug 'octol/vim-cpp-enhanced-highlight'
endif

if has('python') || has('python3')
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
endif
" }}}

" Utility {{{
Plug 'tpope/vim-repeat'

Plug 'flazz/vim-colorschemes'
" }}}

" Filetypes {{{
" Plug 'tpope/vim-markdown'

Plug 'mattn/emmet-vim'

Plug 'pangloss/vim-javascript'

" Plug 'hdima/python-syntax'

if executable('tsc')
    Plug 'leafgarland/typescript-vim'
endif

if has('win32') || executable('mono')
    Plug 'OrangeT/vim-csharp'
endif

if executable('racket')
    Plug 'wlangstroth/vim-racket'
    " {{{
    let g:markdown_fenced_languages += ['racket']
    " }}}
endif

if executable('latex')
    Plug 'lervag/vimtex'
endif

if executable('rustc')
    Plug 'rust-lang/rust.vim'
endif
" }}}

" Misc {{{
if has('win32')
    Plug 'xolox/vim-misc'

    Plug 'xolox/vim-shell'
endif
" }}}

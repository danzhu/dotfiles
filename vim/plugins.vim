" Interface {{{
Plug 'ctrlpvim/ctrlp.vim'
" {{{
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'

if executable('ag')
    let g:ctrlp_user_command  = 'ag -l --nocolor -g "" %s'
    let g:ctrlp_use_caching   = 0
    let g:ctrlp_open_new_file = 'r'
endif
" }}}

if has('python')
    Plug 'sjl/gundo.vim'
    " {{{
    Map n <silent> <C-G> :<C-U>GundoToggle<CR>

    let g:gundo_close_on_revert = 1
    let g:gundo_preview_bottom  = 1
    " }}}
endif

if executable('git')
    Plug 'airblade/vim-gitgutter'
    " {{{
    let g:gitgutter_override_sign_column_highlight = 0
    " }}}

    Plug 'tpope/vim-fugitive'
    " {{{
    if exists(':Gstatus')
        function! TabInfo()
            return '%{fugitive#head(7)}'
        endfunction
    endif
    " }}}
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
    " {{{
    Map n <silent> <C-h> :TmuxNavigateLeft<cr>
    Map n <silent> <C-l> :TmuxNavigateRight<cr>
    Map n <silent> <C-j> :TmuxNavigateDown<cr>
    Map n <silent> <C-k> :TmuxNavigateUp<cr>
    Map n <silent> <C-\> :TmuxNavigatePrevious<cr>

    let g:tmux_navigator_no_mappings = 1
    " }}}
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

if !has('nvim')
    Plug 'haya14busa/incsearch.vim'
    " {{{
    Map! nxo /  <Plug>(incsearch-forward)
    Map! nxo ?  <Plug>(incsearch-backward)
    " Map! nxo g/ <Plug>(incsearch-stay)
    " }}}
end

" Plug 'sickill/vim-pasta'

Plug 'terryma/vim-multiple-cursors'
" {{{
let g:multiple_cursor_exit_from_visual_mode = 0
let g:multiple_cursor_exit_from_insert_mode = 0
" }}}

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-surround'

Map! n s <Plug>Ysurround
Map! x s <Plug>VSurround

Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-endwise'

" Plug 'w0rp/ale'

Plug 'tpope/vim-unimpaired'

if exists('g:cpp_plugins') && !has('nvim') && has('lua') && executable('g++')
    Plug 'jeaye/color_coded'
else
    Plug 'octol/vim-cpp-enhanced-highlight'
endif

if exists('g:cpp_plugins') && (has('python') || has('python3'))
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    " {{{
    let g:UltiSnipsExpandTrigger = '<C-j>'
    " }}}

    Plug 'Valloric/YouCompleteMe'
    " {{{
    Map n <silent> <Leader>g :<C-U>YcmCompleter GoTo<CR>

    let g:ycm_global_ycm_extra_conf = $VIMDIR . '/ycm_extra_conf.py'

    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_min_num_of_chars_for_completion          = 1
    let g:ycm_seed_identifiers_with_syntax             = 1

    let g:ycm_semantic_triggers = {
                \   'css': [ 're!^\s{4}', 're!:\s+' ],
                \   'scss': [ 're!^\s{4}', 're!:\s+' ],
                \   'sass': [ 're!^\s{4}', 're!:\s+' ],
                \ }
    " }}}
endif

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
" {{{
Map! i <c-space> <Plug>(asyncomplete_force_refresh)
" }}}
" }}}

" Utility {{{
Plug 'tpope/vim-repeat'

" Plug 'flazz/vim-colorschemes'
" }}}

" Filetypes {{{
" Plug 'tpope/vim-markdown'

Plug 'mattn/emmet-vim'

Plug 'pangloss/vim-javascript'

Plug 'vim-python/python-syntax'
" {{{
let g:python_highlight_all = 1
" }}}

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

if filereadable($VIMDIR . '/plugins.local.vim')
    source $VIMDIR/plugins.local.vim
endif

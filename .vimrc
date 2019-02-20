" vundle {{{1

" needed to run vundle (but i want this anyways)
set nocompatible

" vundle needs filtype plugins off
" turn it on later

filetype plugin indent off
syntax off

" set the runtime path for vundle
set rtp+=~/.vim/bundle/Vundle.vim

" start vundle environment
call vundle#begin()

" list of plugins {{{2
" let Vundle manage Vundle (this is required)
" old: Plugin 'gmarik/Vundle.vim'
Plugin 'VundleVim/Vundle.vim'

" to install a plugin add it here and run :PluginInstall.
" to update the plugins run :PluginInstall! or :PluginUpdate
" to delete a plugin remove it here and run :PluginClean
 
" YOUR LIST OF PLUGINS GOES HERE LIKE THIS:
"Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-fugitive'

"Plugin 'Rip-Rip/clang_complete'

"Plugin 'ervandew/supertab'

Plugin 'flazz/vim-colorschemes'

Plugin 'altercation/vim-colors-solarized'

"Plugin 'vim-scripts/taglist.vim'

Plugin 'vim-latex/vim-latex'

Plugin 'Superbil/llvm.vim'

"Plugin 'Lokaltog/vim-powerline'

Plugin 'scrooloose/nerdtree'

"Plugin 'wincent/command-t'

Plugin 'python-mode/python-mode'

Plugin 'Valloric/YouCompleteMe'

Plugin 'davidhalter/jedi-vim'

"Plugin 'ctrlpvim/ctrlp.vim'

"Plugin 'itchyny/lightline.vim'

Plugin 'tpope/vim-surround'

Plugin 'vim-syntastic/syntastic'

Plugin 'godlygeek/tabular' "Dependency of vim-markdown
Plugin 'plasticboy/vim-markdown'

"Plugin 'vim-scripts/a.vim'

"Plugin 'honza/vim-snippets'

"Plugin 'SirVer/ultisnips'

" add plugins before this
call vundle#end()

" now (after vundle finished) it is save to turn filetype plugins on

inoremap jk <ESC>
let mapleader="\<Space>"
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
"set clipboard=unnamed
set clipboard=unnamedplus

"set number    " turn line numbers on
"set nonumber  " turn line numbers off
"set number!   " toggle line numbers
"set relativenumber    " turn relative line numbers on
"set norelativenumber  " turn relative line numbers off
"set relativenumber!   " toggle relative line numbers
"set number relativenumber      " turn hybrid line numbers on
"set nonumber norelativenumber  " turn hybrid line numbers off
"set !number !relativenumber    " toggle hybrid line numbers

"Automatic toggling between line number modes
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


syntax on
set encoding=utf-8

"{
set t_Co=256
"}

"{
augroup filetype
  au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END
augroup filetype
  au! BufRead,BufNewFile *Makefile*     set filetype=make
augroup END
augroup filetype
"Native syntax highlighting for Markdown
  au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
"}

"{
map <C-K> :py3f /usr/share/vim/addons/syntax/clang-format.py<cr>
imap <C-K> <c-o>:py3f /usr/share/vim/addons/syntax/clang-format.py<cr>
"let g:clang_format_path = ''
"}

"{
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'
"let g:airline#extensions#disable_rtp_load = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '¦'
let g:airline#extensions#tabline#buffer_idx_mode = 1
set laststatus=2
set t_Co=256
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    " unicode symbols 
    "let g:airline_left_sep = '»'
    "let g:airline_left_sep = '▶'
    "let g:airline_right_sep = '«'
    "let g:airline_right_sep = '◀'
    "let g:airline_symbols.linenr = '␊'
    "let g:airline_symbols.linenr = '␤'
    "let g:airline_symbols.linenr = '¶'
    "let g:airline_symbols.branch = '⎇'
    "let g:airline_symbols.paste = 'ρ'
    "let g:airline_symbols.paste = 'Þ'
    "let g:airline_symbols.paste = '∥'
    "let g:airline_symbols.whitespace = 'Ξ'
endif
"let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
"}

"set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
nnoremap <Leader>ls :ls<CR>
nnoremap <Leader>pb :bp<CR>
nnoremap <Leader>nb :bn<CR>
nnoremap <Leader>. :e#<CR>
"nnoremap <Leader>o :e!<CR>
nnoremap <Leader>sp :sp<CR>

"{
"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMouseMode=2
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMapOpenInTab='<ENTER>'
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=0
map <C-n> :NERDTreeToggle<CR>
" Don't display these kinds of files
let NERDTreeIgnore=[ '\.git', '\.hg', '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
\ '\.o$', '\.so$', '\.egg$', '^\.git$', '__pycache__', '\.DS_Store' ]
"}

"let g:clang_library_path = '/home/ubora/Work/ninja_build/lib/libclang.so'
"let g:clang_user_options='|| exit 0'
" Disable auto popup, use <Tab> to autocomplete
"let g:clang_complete_auto = 0
" Show clang errors in the quickfix window
"let g:clang_debug = 1
"let g:clang_complete_copen = 1
"let g:clang_auto_select = 1
"let g:clang_hl_errors = 1
"let g:clang_close_preview = 1
"let g:clang_use_library = 1
"let g:Powerline_symbols = 'fancy'



"{
"let g:clang_complete_copen = 0
"let g:clang_hl_errors = 1
"let g:clang_snippets = 1
"let g:clang_snippets_engine = "ultisnips"
"let g:clang_close_preview = 1
"let g:clang_complete_macros = 1

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_extra_conf_globlist = ['~/repos/*']
let g:ycm_filetype_specific_completion_to_disable = {'javascript': 1}
let g:ycm_rust_src_path = $HOME . '/repos/rust/src'
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_max_num_candidates = 20
let g:ycm_max_num_identifier_candidates = 7
let g:ycm_auto_trigger = 1
let g:ycm_filetype_whitelist = {'*': 1}
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>'
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_list_stop_completion = ['<C-y>']
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

nnoremap <leader>y :YcmForceCompileAndDiagnostics<cr>
nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>gdf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gdc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <leader>f :YcmCompleter FixIt<CR>

"}

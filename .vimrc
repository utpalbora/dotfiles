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

"Plugin 'durgaswaroop/vim-colors-solarized'

"Plugin 'vim-scripts/taglist.vim'

Plugin 'vim-latex/vim-latex'

Plugin 'Superbil/llvm.vim'

"Plugin 'Lokaltog/vim-powerline'

Plugin 'scrooloose/nerdtree'

"Plugin 'wincent/command-t'

"Plugin 'klen/python-mode'

Plugin 'Valloric/YouCompleteMe'

"Plugin 'ctrlpvim/ctrlp.vim'

"Plugin 'itchyny/lightline.vim'

"Plugin 'tpope/vim-surround'

"Plugin 'scrooloose/syntastic'

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

syntax on
set encoding=utf-8

"{
map <C-K> :py3f /home/ubora/Work/llvm/tools/clang/tools/clang-format/clang-format.py<cr>
imap <C-K> <c-o>:py3f /home/ubora/Work/llvm/tools/clang/tools/clang-format/clang-format.py<cr>
let g:clang_format_path = '/home/ubora/Work/ninja_build/bin/clang-format'
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

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
"}

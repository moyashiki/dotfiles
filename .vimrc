 if 0 | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
" recommended to install
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim'

" My Bundles here:
NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'octol/vim-cpp-enhanced-highlight'
" ANSI Color display
"NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
NeoBundle 'verilog.vim'
NeoBundle 'fatih/vim-go'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-markdown'
" html support
NeoBundle 'mattn/emmet-vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'sudo.vim'
" visualize indent
NeoBundle 'Yggdroot/indentLine'
" syntax check
NeoBundle 'scrooloose/syntastic'
" autoclose 
NeoBundle 'Townk/vim-autoclose'
" cpp highlighting
NeoBundleLazy 'vim-jp/cpp-vim' , {
	\ 'autoload' : {'filetype' : 'cpp'}}
" Google calendar
NeoBundle 'itchyny/calendar.vim'
NeoBundle 'wincent/Command-T'
" Vim-Latex
" NeoBundle 'jcf/vim-latex'
" quickrun
NeoBundle 'thinca/vim-quickrun'
"  :D :D :D
" NeoBundle 'drillbits/nyan-modoki.vim'
" Colorscheme
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'ciaranm/inkpot'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'cocopon/iceberg.vim'
NeoBundle 'Shougo/neocomplete.vim'

call neobundle#end()
" After Installation
filetype plugin indent on     " required!
" Installation check.
NeoBundleCheck
"""""""""""""""""
" colorscheme
" """"""""""""""
" colorscheme jellybeans 
" colorscheme lucius
colorscheme inkpot

"############# Misc
set number " show line number
set tabstop=2
set shiftwidth=2
set backupdir=/tmp
set directory=/tmp
set pastetoggle=<F1> "コピペ対策
syntax on
set laststatus=2
"set statusline=%F%m%r%h%w[%{&ff}]%=%{g:NyanModoki()}(%l,%c)[%P]
set statusline=%F%m%r%h%w[%{&ff}]%=(%l,%c)[%P]
set backspace=start,eol,indent
"*****************************************************************************
""" Abbreviations
"*****************************************************************************
""" no one is really happy until you have this shortcuts
cab W! w!
cab Q! q!
cab Wq wq
cab Wa wa
cab wQ wq
cab WQ wq
cab W w
cab Q q

"##########################
"  Plugin Settings
"
"#########################
" nyan-modoki settings
let g:nyan_modoki_select_cat_face_number = 2
let g:nayn_modoki_animation_enabled= 1

"########################
" Unite.vim
"
"########################
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>#
"#########################
"
" quickrun.vim
"
"########################
let g:quickrun_config = {
\   "_" : {
\       "runner" : "vimproc",
\   },
\}
" NeoComplete & NeoComplcache
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" " Use smartcase.
let g:neocomplete#enable_smart_case = 1
" " Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"
" " Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
	\ 'default' : '',
	\ 'vimshell' : $HOME.'/.vimshell_hist',
	\ 'scheme' : $HOME.'/.gosh_completions'
  \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] =	'\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>	neocomplete#undo_completion()
inoremap <expr><C-l>	neocomplete#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h>	neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>		neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>	neocomplete#close_popup()
inoremap <expr><C-e>	neocomplete#cancel_popup()
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ?	neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>          neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right>	neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>	neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>	neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1
"
" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1
" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ?
"\<Down>" : "\<C-x>\<C-u>"
"
" Enable omni completion.
autocmd FileType css setlocal	omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal	omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal	omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal	omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal	omnifunc=xmlcomplete#CompleteTags
"
" Enable heavy omni completion.
if	!exists('g:neocomplete#sources#omni#input_patterns')
let	g:neocomplete#sources#omni#input_patterns =	{}
endif
"let	g:neocomplete#sources#omni#input_patterns.php	= '[^. \t]->\h\w*\|\h\w*::'
let	g:neocomplete#sources#omni#input_patterns.c	= '[^.[:digit:] *\t]\%(\.\|->\)'
let	g:neocomplete#sources#omni#input_patterns.cpp	= '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let	g:neocomplete#sources#omni#input_patterns.perl	= '\h\w*->\h\w*\|\h\w*::'

" Vim-Latex
"let tex_flavor = 'latex'
"set grepprg=grep\ -nH\ $*
"set shellslash
"let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
"let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
"let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"""
" Calendar.vim
"""
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
""""
" indentLine
"""
let g:indentLine_faster = 1
nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>

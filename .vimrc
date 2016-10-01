"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/moyashiki/.vim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/moyashiki/.vim/')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/neocomplete.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('vim-scripts/AnsiEsc.vim')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

call dein#add('L9')
call dein#add('FuzzyFinder')
call dein#add('fatih/vim-go')
call dein#add('tpope/vim-rails')
call dein#add('tpope/vim-haml')
call dein#add('tpope/vim-markdown')
" html support
call dein#add('sudo.vim')
call dein#add('ciaranm/inkpot')
" visualize indent
" call dein#add('Yggdroot/indentLine')
" ## http://qiita.com/karur4n/items/a26007236c59c5fb8735
" syntax check
call dein#add('scrooloose/syntastic')
" autoclose 
call dein#add('Townk/vim-autoclose')
" quickrun
call dein#add('thinca/vim-quickrun')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"""""""""""""""""
" colorscheme
"""""""""""""""""
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
" Vim-Latex
"let tex_flavor = 'latex'
"set grepprg=grep\ -nH\ $*
"set shellslash
"let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
"let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
"let g:Tex_FormatDependency_pdf = 'dvi,pdf'
""""
" indentLine
"""
let g:indentLine_faster = 1
nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>
"""
" neosnippet
"""
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
"

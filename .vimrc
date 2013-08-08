set nocompatible               " be iMproved
 filetype off                   " required!
 filetype plugin indent off     " required!

 if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
   call neobundle#rc(expand('~/.vim/bundle/'))
 endif
 " let NeoBundle manage NeoBundle
 " required! 
 "NeoBundle 'Shougo/neobundle.vim'
 " recommended to install
 NeoBundle 'Shougo/vimproc'
 " after install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
 NeoBundle 'Shougo/vimshell'
 NeoBundle 'Shougo/unite.vim'
 NeoBundle 'Shougo/neocomplcache'

 " My Bundles here:
 "
 " original repos on github
 NeoBundle 'tpope/vim-fugitive'
 NeoBundle 'Lokaltog/vim-easymotion'
 NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 " vim-scripts repos
 NeoBundle 'L9'
 NeoBundle 'FuzzyFinder'
 NeoBundle 'verilog.vim'
 NeoBundle 'tpope/vim-rails'
 NeoBundle 'tpope/vim-haml'
 NeoBundle 'tpope/vim-markdown'
 NeoBundle 'scrooloose/nerdtree'
 NeoBundle 'hail2u/vim-css3-syntax'
 " non github repos
 NeoBundle 'git://git.wincent.com/command-t.git'
 " color scheme
 NeoBundle 'altercation/vim-colors-solarized'
 " Vim-Latex
 NeoBundle 'jcf/vim-latex'
 NeoBundle 'thinca/vim-quickrun'
" Colorscheme
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'tomasr/molokai'
" colorscheme jellybeans 
colorscheme lucius
 filetype plugin indent on     " required!
" colorscheme
"set background=dark
" colorscheme solarized
"
"############# Misc
"
set tabstop=2
set shiftwidth=2
set backupdir=/tmp
set directory=/tmp

"##########################
"  Plugin Settings
"
"#########################
"
" Neocomp
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
"
"
" Vim-Latex
let tex_flavor = 'latex'
set grepprg=grep\ -nH\ $*
set shellslash
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'

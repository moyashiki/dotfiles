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
 NeoBundle 'rails.vim'
 " non github repos
 NeoBundle 'git://git.wincent.com/command-t.git'
 " color scheme
 NeoBundle 'altercation/solarized'

 filetype plugin indent on     " required!

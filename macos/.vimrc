" Vim setting

set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install NeoBundle..."
        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

"insert here your Neobundle plugins"
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tomasr/molokai'
NeoBundle 'itchyny/lightline.vim'


call neobundle#end()
filetype plugin indent on

NeoBundleCheck

set enc=utf-8
set fencs=utf-8,iso2022-jp,euc-jp,sjis
set showcmd
set autoread

set title
set number
set ruler

" if has("syntax")
"   syntax on
" endif

"set cursorline
"set cursorcolumn

set laststatus=2
set cmdheight=2

set helpheight=999

set expandtab
set tabstop=2
set smartindent
set shiftwidth=2

set list
set listchars=tab:>\ ,trail:_,eol:↲,extends:>
set backspace=indent,eol,start

set visualbell

set showmatch

set ignorecase
set smartcase

set hidden

set incsearch

set mouse=a
set ttymouse=xterm2

set clipboard=unnamed,autoselect


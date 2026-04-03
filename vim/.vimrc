set nocompatible

set number
set relativenumber

set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

set hlsearch
set incsearch
set ignorecase
set smartcase

set mouse=a
set ruler
set showcmd
set wildmenu

set backspace=indent,eol,start

syntax on
filetype plugin indent on

" YAML
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab autoindent indentkeys-=0# number norelativenumber
autocmd FileType yaml setlocal breakindent linebreak

" paste mode
set pastetoggle=<C-p>

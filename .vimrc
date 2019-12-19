" basic rules
set encoding=utf-8
scriptencoding utf-8
set nocompatible
set number
syntax enable
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set hlsearch
set smarttab
set showmatch
set showcmd
set ignorecase
set nobackup
set showbreak=↪
set incsearch
set backspace=indent,eol,start
set clipboard=unnamed,autoselect
" /basic rules

" key map
noremap j gj
noremap k gk
noremap gj j
noremap gk k
noremap <S-h> ^
noremap <S-j> }
noremap <S-k> {
noremap <S-l> $
noremap == gg=G''

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
" /key map

" complement bracket
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o><TAB>
inoremap ( ()<ESC>i
inoremap (<ENTER> ()<Left><CR><ESC><S-o><TAB>
inoremap < <><Left>
inoremap ' ''<Left>
inoremap " ""<Left>
" /complement bracket

" key map plugin
noremap <Space>f :VimFiler<Enter>
" /key map plugin

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'

call neobundle#end()

NeoBundleCheck

filetype plugin indent on

set encoding=utf-8
scriptencoding utf-8
set nocompatible

set ruler
set number

set virtualedit=onemore

set background=dark

autocmd ColorScheme * highlight LineNr ctermfg=12
highlight CursorLineNr ctermbg=4 ctermfg=0
set cursorline
highlight clear CursorLine

syntax enable

set autoindent

set shiftwidth=4
set softtabstop=4
set tabstop=4

set expandtab
set smarttab

set visualbell t_vb=

set wrap

set noincsearch
set hlsearch
set ignorecase
set smartcase
set wrapscan
set gdefault


set list
set listchars=tab:>-,eol:↲,extends:»,precedes:«,nbsp:%

set wildmode=list:longest,full

set showcmd

set clipboard=unnamed,autoselect

set whichwrap=b,s,h,l,<,>,~,[,]

set backspace=indent,eol,start
set nrformats-=octal

set pumheight=10

set showmatch
set matchtime=1
source $VIMRUNTIME/macros/matchit.vim

set display=lastline

set hidden

set nobackup
"set backupdir=$HOME/.vim/backup
set nobackup
set noundofile
set undodir=$HOME/.vim/backup
set noswapfile






nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <down> gj
nnoremap <up> gk
noremap <S-h> ^
noremap <S-j> }
noremap <S-k> {
noremap <S-l> $

inoremap ;; <esc>

nnoremap <CR> A<CR><ESC>
nnoremap <space> i<space><esc>

nnoremap r <C-r>

nnoremap Y y$

nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

imap <C-j> <esc>
noremap! <C-j> <esc>

if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")

endif


filetype plugin indent on

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/

    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install NeoBundle..."
        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

"auto hokan
if has('lua') 
    NeoBundle 'Shougo/neocomplete.vim'
    NeoBundle "Shougo/neosnippet"
    NeoBundle 'Shougo/neosnippet-snippets'
endif

if neobundle#is_installed('neocomplete.vim')
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#min_keyword_length = 3
    let g:neocomplete#enable_auto_delimiter = 1
    let g:neocomplete#auto_completion_start_length = 1
    inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"

    imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
    imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
endif



call neobundle#end()

filetype plugin indent on

NeoBundleCheck

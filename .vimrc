" basic rules
set encoding=utf-8
scriptencoding utf-8
set nocompatible
set number
set numberwidth=3
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
set incsearch
set wrap
nnoremap <silent><Esc><Esc> :<C-u>setnohlsearch!<CR>
set cursorline
set wildmenu
set background=dark
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
noremap <S-s> :w<CR>
noremap <S-q> :q!<CR>

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
noremap <Space>n :NERDTreeToggle<Enter>
" /key map plugin


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


" setting to start vim
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'w0ng/vim-hybrid'

" setting vim-airline
let g:airline#extensions#tabline#enabled=1
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab
let g:airline#extensions#tabline#buffer_idx_format={
    \ '0': '0 ',
    \ '1': '1 ',
    \ '2': '2 ',
    \ '3': '3 ',
    \ '4': '4 ',
    \ '5': '5 ',
    \ '6': '6 ',
    \ '7': '7 ',
    \ '8': '8 ',
    \ '9': '9 '
    \}
" /setting vim-airline

" auto complement syntax
if has('lua')
    NeoBundle 'Shougo/neocomplete.vim'
    NeoBundle 'Shougo/neosnippet'
    NeoBundle 'Shougo/neosnippet-snippets'
endif

" settings neocomplete
if neobundle#is_installed('neocomplete.vim')
    let g:neocomplete#enable_at_startup=1
    let g:neocomplete#enable_smart_case=1
    let g:neocomplete#min_keyword_length=3
    let g:neocomplete#enable_auto_delimiter=1
    let g:neocomplete#auto_competion_start_length=1
    inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"

    imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
    imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
endif

" settings neocomplete
" /auto complement syntax


call neobundle#end()

" color scheme
autocmd ColorScheme * highlight LineNr ctermfg=248
colorscheme hybrid
" /color scheme

NeoBundleCheck
" /setting to start vim

filetype plugin indent on

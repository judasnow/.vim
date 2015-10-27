"{{{
if has("win32")
    let $VIMFILES = $VIM.'/vimfiles'
    let $V = $VIM.'/_vimrc'
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
    language message zh_CN.UTF-8
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
else
    let $VIMFILES = $HOME.'/.vim'
    let $V = $HOME.'/.vimrc'
endif
"}}}

" plugin
"{{{
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'

Plugin 'The-NERD-tree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mattn/emmet-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Kris2k/matchit'
Plugin 'Valloric/MatchTagAlways'
Plugin 'Layzie/jquery.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'ervandew/supertab'
Plugin 'terryma/vim-expand-region'
Plugin 'mbbill/undotree'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'wakatime/vim-wakatime'
Plugin 'StanAngeloff/php.vim'
Plugin 'sjl/gundo.vim'
Plugin 'cespare/vim-toml'

"Plugin 'Shougo/neocomplcache.vim'
"Plugin 'Shougo/neocomplete.vim'
Plugin 'mileszs/ack.vim'
Plugin 'xolox/vim-lua-ftplugin'
"Plugin 'mustache/vim-mustache-handlebars'
Plugin 'wlangstroth/vim-racket'
Plugin 'vim-jp/vim-java'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'scrooloose/syntastic'
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'skammer/vim-css-color'

Plugin 'kien/rainbow_parentheses.vim'
"Plugin 'davidhalter/jedi-vim'
Plugin 'hdima/python-syntax'
Plugin 'rust-lang/rust.vim'
Plugin 'phildawes/racer'
"Plugin 'tpope/vim-fugitive'
"Plugin 'alexjgriffin/sprinkles'

"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Yggdroot/indentLine'

"Plugin 'SirVer/ultisnips'

Plugin 'tmhedberg/SimpylFold'

Plugin 'bling/vim-airline'
" Plugin 'eagletmt/ghcmod-vim'
Plugin 'hynek/vim-python-pep8-indent'

" colors
Plugin 'altercation/vim-colors-solarized'

Plugin 'Shutnik/jshint2.vim'
Plugin 'vim-scripts/tornadotmpl.vim'
Plugin 'mhinz/vim-startify'
Plugin 'groenewege/vim-less'
Plugin 'judasnow/vim-ls'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'othree/html5.vim'
Plugin 'oscarh/vimerl'
Plugin 'kchmck/vim-coffee-script'

" utils
Plugin 'junegunn/vim-easy-align'

" for haskell
Plugin 'yogsototh/haskell-vim'
Plugin 'pbrisbin/html-template-syntax'
Plugin 'Twinside/vim-hoogle'
Plugin 'eagletmt/neco-ghc'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'enomsg/vim-haskellConcealPlus'

" for js
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'mxw/vim-jsx'

" for c & c++ lang
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'bbchung/clighter'

" for lisp
Plugin 'kovisoft/slimv'

" for js

"???
Plugin 'Lokaltog/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'vim-scripts/taglist.vim'
"Plugin 'tpope/vim-fugitive'

Plugin 'Shougo/vimshell.vim'
Plugin 'godlygeek/tabular'

Plugin 'vim-scripts/LargeFile'
Plugin 'L9'
Plugin 'bufexplorer.zip'

call vundle#end()
filetype plugin indent on
"}}}

"common
"{{{
"set relativenumber
set nocompatible
syntax on
set autoindent
set go=
set number
set cmdheight=1
set wildmenu
set noerrorbells
set showmatch
set incsearch
setlocal noswapfile
set hlsearch
set wrapscan
set ignorecase
set matchpairs=(:),{:},[:],<:>
set whichwrap =b,s,<,>,[,]
set paste
inoremap jj <ESC>
set lbr
set lazyredraw
set foldlevelstart=0
set t_Co=256
set autoread
filetype plugin on
filetype indent on
set so=7
set scrolljump=6
set hidden
set nosmartindent
set laststatus=0
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
set novb
set noswapfile
set nobackup
set nomodeline
set foldmethod=indent

"set cursorline
"set cuc
"}}}

"tab
"{{{
filetype indent on
set ts=4 sw=4 sts=4 expandtab
autocmd FileType ls setlocal ts=2 sw=2 sts=2 expandtab
autocmd FileType coffee setlocal ts=2 sw=2 sts=2 expandtab
autocmd FileType python setlocal ts=4 sw=4 sts=4 expandtab
"}}}

"font & color
"{{{
set guifont=Monaco:h14
set linespace=7
set encoding=utf8
set fileencoding=utf8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set langmenu=none
language messages zh_cn.utf-8
"内部编码
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,chinese,latin-1

syntax enable

if strftime("%H") <= 18 && strftime("%H") >= 9
    " 白天的颜色
    colorscheme desert
else
    hi nontext guifg=#444444
    let g:solarized_contrast="high"
    let g:solarized_visibility="high"

    set background=dark
    colorscheme solarized
endif

if has("win32")
    let g:solarized_bold=1    "default value is 1
    let g:solarized_underline=1    "default value is 1
    let g:solarized_contrast="high"    "default value is normal
    syntax enable
    set background=dark
    colorscheme solarized
    set guifont=Monaco:h10
    set gfw=Yahei_Mono:h10:cGB2312
endif
"}}}

"session
"{{{
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif
set sessionoptions+=unix
set sessionoptions-=blank
set sessionoptions-=options
autocmd VimEnter * call LoadSession()
autocmd VimLeave * call MakeSession()

function! MakeSession()
    if !has('gui_running')
        hi clear
    endif
    if bufname('')  == ''
        exe 'bdelete '.bufnr('')
    endif
    let l:count = 0
    let l:i = 0
    while l:i <= bufnr('$')
        if buflisted(count)
            let l:count += 1
        endif
        let l:i+=1
    endwhile
    if l:count >= 4
        mksession! ~/.last_session.vim
    endif
endfunction

function! LoadSession()
    "if exists('g:SessionLoaded')
    "return
    "endif
    if expand('%') == '' && filereadable($HOME.'/.last_session.vim') && !&diff
        silent so ~/.last_session.vim
    endif

    let l:buftotal = bufnr('$')
    let l:i = 0
    let l:crtpath = getcwd()
    while l:i <= l:buftotal
        " 列表中还未载入的buffer，如果不在当前工作目录，会被删除
        if !bufloaded(l:i) && buflisted(l:i) && expand('%:p') !~ l:crtpath
            exe 'bdelete '.l:i
            echo expand('%:p') .' !~ '. l:crtpath
        endif
        let l:i += 1
    endwhile
endfunction

"}}}

"NERDTree
"{{{
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['^\.$', '^\.\.$', '\.pyc', '\~$', '\.swo$', '\.swp$', '\.hg', '\.svn', '\.bzr', '\.DS_Store']
let NERDTreeChDirMode=2     "setting root dir in NT also sets VIM's cd
let NERDTreeQuitOnOpen=0 "the Nerdtree window will be close after a file is opend.
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
"}}}

"list
"{{{
set nolist
set listchars=tab:-\ ,eol:¬,extends:-,precedes:¬
set splitbelow
set splitright
"}}}

"conqueterm
"{{{
let g:ConqueTerm_FastMode = 0
let g:ConqueTerm_Color = 1
let g:ConqueTerm_PromptRegex = '^\w\+@[0-9A-Za-z_.-]\+:[0-9A-Za-z_./\~,:-]\+\$'
let g:ConqueTerm_Syntax = 'conque'
let g:ConqueTerm_ColorMode = 'conceal'
let g:ConqueTerm_CodePage = 0
"}}}

"bufexplorer
"{{{
let g:bufExplorerSortBy='mru'
let g:bufExplorerSplitRight=0
let g:bufExplorerSplitVertical=1
let g:bufExplorerSplitVertSize = 30
let g:bufExplorerUseCurrentWindow=1
"}}}

" syntastic
let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
set cc = 100

" vertical line indentation
" You can also use one of ¦, ┆, ︙, or │,
" base03    #002b36  8/4 brblack  234 #1c1c1c 15 -12 -12   0  43  54 193 100  21
" base02    #073642  0/4 black    235 #262626 20 -12 -12   7  54  66 192  90  26
" base01    #586e75 10/7 brgreen  240 #4e4e4e 45 -07 -07  88 110 117 194  25  46
" base00    #657b83 11/7 bryellow 241 #585858 50 -07 -07 101 123 131 195  23  51
" base0     #839496 12/6 brblue   244 #808080 60 -06 -03 131 148 150 186  13  59
" base1     #93a1a1 14/4 brcyan   245 #8a8a8a 65 -05 -02 147 161 161 180   9  63
" base2     #eee8d5  7/7 white    254 #d7d7af 92 -00  10 238 232 213  44  11  93
" base3     #fdf6e3 15/7 brwhite  230 #ffffd7 97  00  10 253 246 227  44  10  99
" yellow    #b58900  3/3 yellow   136 #af8700 60  10  65 181 137   0  45 100  71
" orange    #cb4b16  9/3 brred    166 #d75f00 50  50  55 203  75  22  18  89  80
" red       #dc322f  1/1 red      160 #d70000 50  65  45 220  50  47   1  79  86
" magenta   #d33682  5/5 magenta  125 #af005f 50  65 -05 211  54 130 331  74  83
" violet    #6c71c4 13/5 brmagenta 61 #5f5faf 50  15 -45 108 113 196 237  45  77
" blue      #268bd2  4/4 blue      33 #0087ff 55 -10 -45  38 139 210 205  82  82
" cyan      #2aa198  6/6 cyan      37 #00afaf 60 -35 -05  42 161 152 175  74  63
" green     #859900  2/2 green     64 #5f8700 60 -20  65 133 153   0  68 100  60
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#586e75'
let g:indentLine_char = '┆'
let g:indentLine_enabled = 0

" 顺便设置 hidden characters 的颜色
highlight NonText guifg=#586e75
highlight SpecialKey guifg=#586e75

"indent_guides
"{{{
"let g:indent_guides_auto_colors = 1
"let g:indent_guides_guide_size = 1
"let g:indent_guides_enable_on_vim_startup=0
"let g:indent_guides_space_guides = 1

"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg="#4e4e4e"   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg="#4e4e4e" ctermbg=4
"}}}

"powerline | airline
"{{{
set laststatus=2
"set laststatus=0
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
set fillchars+=stl:\ ,stlnc:\
let g:airline_theme="base16"
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:Powerline_symbols = 'compatible'"let Powerline_symbols = 'compatible'
let Powerline_symbols = 'compatible'
"}}}

"rainbow
"{{{
nnoremap <leader>R :RainbowParenthesesToggle<cr>
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
"}}}

"tlist
"{{{
let Tlist_Use_Right_Window = 1
"}}}

"file type
"{{{
au BufRead,BufNewFile *.tpl set ft=html syntax=html
au BufRead,BufNewFile *.cshtml set ft=html syntax=html
au FileType javascript call JavaScriptFold()
"}}}

" fold
" set foldmethod=syntax
" set foldlevelstart=1

" let javaScript_fold=1         " JavaScript
" let php_folding=1             " PHP
" let vimsyn_folding='af'       " Vim script

"持久化撤销操作
"{{{
set undofile
set undodir=$VIMFILES/\_undodir
set undolevels=512 "maximum number of changes that can be undone
"}}}

"折叠设置
"{{{
set foldmethod=marker
set foldlevel=128
"set foldcolumn=4
"}}}


"breaking bad habit
"vim. live it.
""{{{
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>
"inoremap <Up> <NOP>
"inoremap <Down> <NOP>
"inoremap <Left> <NOP>
"inoremap <Right> <NOP>
"
"noremap h <NOP>
"noremap j <NOP>
"noremap k <NOP>
"noremap l <NOP>
"}}}


" key maps
map <F11> IndentLinesToggle<CR>


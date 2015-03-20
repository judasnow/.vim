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
Plugin 'mattn/emmet-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Kris2k/matchit'
Plugin 'Valloric/MatchTagAlways'
Plugin 'Layzie/jquery.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'terryma/vim-expand-region'
Plugin 'mbbill/undotree'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'mileszs/ack.vim'
Plugin 'xolox/vim-lua-ftplugin'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'wlangstroth/vim-racket'
Plugin 'vim-jp/vim-java'
Plugin 'hylang/vim-hy'

Plugin 'kien/rainbow_parentheses.vim'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'fs111/pydoc.vim'
"Plugin 'hdima/python-syntax'
"Plugin 'tpope/vim-fugitive'
Plugin 'alexjgriffin/sprinkles'

Plugin 'tmhedberg/SimpylFold'

Plugin 'bling/vim-airline'
Plugin 'eagletmt/ghcmod-vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'

Plugin 'Shutnik/jshint2.vim'
Plugin 'vim-scripts/tornadotmpl.vim'
Plugin 'mhinz/vim-startify'
Plugin 'groenewege/vim-less'
Plugin 'judasnow/vim-ls'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'othree/html5.vim'
Plugin 'oscarh/vimerl'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'mxw/vim-jsx'

"Plugin 'kovisoft/slimv'

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
set cc=80
set vb t_vb=
set novb
set noswapfile
set nobackup
set nomodeline
"set cursorline
"set cuc
"}}}

"tab
"{{{
filetype indent on
set ts=4 sw=4 sts=4 expandtab
autocmd FileType ls setlocal ts=2 sw=2 sts=2 expandtab
autocmd FileType python setlocal ts=4 sw=4 sts=4 expandtab
"}}}

"font & color
"{{{
hi nontext guifg=#999999
set guifont=Monaco:h13
":set guifont=Menlo:h14
set linespace=5
set encoding=utf8
set fileencoding=utf8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set langmenu=none
language messages zh_cn.utf-8
"内部编码
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,chinese,latin-1


let g:solarized_contrast="high"    "default value is normal
syntax enable
set background=dark
colorscheme solarized

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
set list
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

"indent_guides
"{{{
let g:indent_guides_auto_colors = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_space_guides = 1

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
"}}}

"持久化撤销操作
"{{{
set undofile
set undodir=$VIMFILES/\_undodir
set undolevels=1000 "maximum number of changes that can be undone
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



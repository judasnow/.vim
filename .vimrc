"os?
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

"bundle
"{{{
set nocompatible
filetype off 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'vim-scripts/LargeFile' 
Bundle 'L9'
Bundle 'bufexplorer.zip'
Bundle 'The-NERD-tree'
Bundle 'mattn/emmet-vim'
Bundle "Valloric/YouCompleteMe"
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Kris2k/matchit'
Bundle 'Valloric/MatchTagAlways'
Bundle 'Layzie/jquery.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'Lokaltog/TagHighlight'
Bundle 'scrooloose/nerdcommenter'
Bundle 'ervandew/supertab'
Bundle 'terryma/vim-expand-region'
Bundle "mbbill/undotree"
Bundle 'Shougo/neocomplcache.vim'
Bundle 'Shougo/neocomplete.vim'
Bundle 'mileszs/ack.vim'
Bundle 'xolox/vim-lua-ftplugin'
Bundle 'mustache/vim-mustache-handlebars'
<<<<<<< Updated upstream
Bundle 'wlangstroth/vim-racket'

Bundle 'jnurmine/Zenburn'
=======
Bundle 'tpope/vim-fireplace'
Bundle 'gosukiwi/vim-atom-dark'
>>>>>>> Stashed changes

Bundle 'kien/rainbow_parentheses.vim'
"Bundle 'tpope/vim-fugitive'

Bundle 'bling/vim-airline'

Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
Bundle 'morhetz/gruvbox'
Bundle 'MichaelMalick/vim-colors-bluedrake'
Bundle 'chriskempson/base16-vim'
Bundle 'vim-scripts/tornadotmpl.vim'
Bundle 'blerins/flattown'
Bundle 'jnurmine/Zenburn'
Bundle 'vim-scripts/SlateDark'
Bundle 'nice/sweater'
Bundle 'vim-scripts/desertEx'
Bundle 'blerins/flattown'
Bundle 'zeis/vim-kolor'
Bundle 'vim-scripts/playroom'
Bundle 'nelstrom/vim-mac-classic-theme'
Bundle 'vim-scripts/donbass.vim'
Bundle 'w0ng/vim-hybrid'
Bundle 'gregsexton/Atom'

Bundle 'mhinz/vim-startify'
Bundle 'Shutnik/jshint2.vim'
Bundle 'judasnow/vim-ls'

Bundle 'groenewege/vim-less'
Bundle "jelera/vim-javascript-syntax"
Bundle 'hail2u/vim-css3-syntax'
Bundle 'hdima/python-syntax'
Bundle 'tmhedberg/SimpylFold'
Bundle 'othree/html5.vim'
Bundle 'oscarh/vimerl'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
Bundle 'mxw/vim-jsx'

Bundle "kovisoft/slimv"

"???
Bundle 'Lokaltog/vim-easymotion'
Bundle 'terryma/vim-multiple-cursors'

Bundle 'vim-scripts/taglist.vim'
Bundle 'tpope/vim-fugitive'

Bundle 'Shougo/vimshell.vim'
Bundle "godlygeek/tabular"

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
set linespace=3
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
set guifont=Monaco:h15
":set guifont=Menlo:h14
set ls=5
set encoding=utf8
set fileencoding=utf8

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

"enncode
"{{{
set langmenu=none
language messages zh_cn.utf-8
set fileencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
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
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_space_guides = 1
"}}}

"powerline | airline
"{{{
set laststatus=2
"set laststatus=0
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
"set fillchars+=stl:\ ,stlnc:\
let g:airline_theme="luna"
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:Powerline_symbols = 'compatible'
"let Powerline_symbols = 'compatible'
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
set foldlevel=1024
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



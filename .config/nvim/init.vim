let mapleader=','

if has('ide') == 0
    " Use an environment with pynvim already installed
    let g:python3_host_prog='$HOME/.nvim-env/venv/bin/python'

    "====================="
    " Begin Plugin Config "
    "====================="
    call plug#begin(stdpath('data') . '/plugged')
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'

    Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --all' }
    call plug#end()

    let g:go_fmt_command='goimports'
    let g:go_highlight_types=1
    let g:go_highlight_fields=1
    let g:go_highlight_functions=1
    let g:go_highlight_function_calls=1
    let g:go_highlight_operators=1
    let g:go_highlight_extra_types=1

    colorscheme slate
    "==================="
    " End Plugin Config "
    "==================="
endif

"==============="
" Begin Options "
"==============="
set number relativenumber  " Hybrid line numbers
set history=500
set so=7                   " Keep some lines visible above and below the cursor
set tm=500

" Be civilized when searching
set hlsearch
set ignorecase
set incsearch
set smartcase

if has('ide')
    set ideajoin               " Use IntelliJ's line joining behavior
    set ideaput                " Use IntelliJ's pasting behavior
    set idearefactormode=keep  " Don't change modes after refactoring
else
    set hidden
    set ruler            " Always show current position
    set showmatch        " Show matching brackets under cursor
    set termguicolors
    set wrap             " No horizontal scrolling
    set cmdheight=1
    set colorcolumn=120
    set encoding=utf8
    set shortmess+=c     " Don't pass messages to |ins-completion-menu|
    set signcolumn=yes
    set updatetime=300
    set magic

    " Explicitly mark tabs and trailing whitespace
    set list listchars=tab:»\ ,trail:°

    " Disable backups
    set nobackup
    set noswapfile
    set nowb

    " Be civilized about tabs and indents
    set ai
    set expandtab
    set si
    set smarttab
    set ts=4
    set sw=4

    " Command line completion
    set wildmenu
    set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

    " Disable sounds
    set noerrorbells
    set novisualbell
    set t_vb=

    " Sensible split defaults
    set splitbelow
    set splitright
endif
"============="
" End Options "
"============="

"================"
" Begin Commands "
"================"
if has('ide')
    " Use the IDE bindings by default
    sethandler a:ide

    " Search
    map <leader>g <Action>(FindInPath)
    map <leader>f <Action>(GotoFile)
    map <leader>b <Action>(Switcher)

    " Code navigation
    map <leader>j <Action>(GotoDeclaration)
    map <leader>r <Action>(FindUsages)
    "nmap <C-o> <Action>(Back)
    "nmap <C-i> <Action>(Forward)
else
    " Reload files that change externally
    set autoread
    au FocusGained,BufEnter * checktime

    " Return to last edit position when opening files
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

    " Search
    nmap <leader>g :Rg<space>
    nmap <leader>f :Files<cr>
    nmap <leader>b :Buffers<cr>

    " Code navigation
    nnoremap <leader>j :YcmCompleter GoTo<cr>
    nnoremap <leader>r :YcmCompleter GoToReferences<cr>

    " Clear highlights
    nmap <silent> <leader><cr> :noh<cr>
endif
"=============="
" End Commands "
"=============="

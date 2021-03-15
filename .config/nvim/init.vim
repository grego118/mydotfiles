let mapleader=','

let g:python_host_prog='/Users/austin/.local/share/virtualenvs/nvim2-wTOmZJnA/bin/python'
let g:python3_host_prog='/Users/austin/.local/share/virtualenvs/nvim3--44AzIVz/bin/python'


"==============="
" Plugin Config "
"==============="
call plug#begin(stdpath('data') . '/plugged')

Plug 'whatyouhide/vim-gotham'
Plug 'vim-airline/vim-airline'

Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

Plug 'junegunn/fzf', {'do': './install --bin'}
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'

Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'dart-lang/dart-vim-plugin'

Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --all' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()


let NERDTreeShowHidden=0


let g:go_fmt_command='goimports'
let g:go_highlight_types=1
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_function_calls=1
let g:go_highlight_operators=1
let g:go_highlight_extra_types=1


let g:dart_style_guide=2
let g:dart_format_on_save=1


let g:UltiSnipsExpandTrigger='<C-l>'


"========="
" Options "
"========="
colorscheme gotham256


set hidden

set number relativenumber  " Hybrid line numbers

set ruler  " Always show current position

set showmatch  " Show matching brackets under cursor

set termguicolors

set wrap  " No horizontal scrolling


set cmdheight=1

set colorcolumn=88

set encoding=utf8

set history=500

set list listchars=tab:»\ ,trail:°  " Explicitly mark tabs and trailing whitespace

set shortmess+=c  " Don't pass messages to |ins-completion-menu|

set signcolumn=yes

set so=7  " Keep some lines visible above and below the cursor

set updatetime=300


" Be civilized about external changes
set autoread
au FocusGained,BufEnter * checktime


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


" Be civilized when searching
set hlsearch
set ignorecase
set incsearch
set magic
set smartcase


" Command line completion
set wildmenu
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store


" Disable sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500


" Sensible split defaults
set splitbelow
set splitright


"=========="
" Commands "
"=========="
" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


nmap <leader>g :Rg<space>

nmap <leader>b :Buffers<cr>

nmap <leader>f :Files<cr>

nmap <leader>t :NERDTreeFind<cr>

nmap <silent> <leader><cr> :noh<cr>  " Clear highlights


" GoTo code navigation
nnoremap <leader>j :YcmCompleter GoTo<cr>
nnoremap <leader>r :YcmCompleter GoToReferences<cr>


" Easy command execution
nmap <leader>p :VimuxPromptCommand<cr>
nmap <leader>l :VimuxRunLastCommand<cr>

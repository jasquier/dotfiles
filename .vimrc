" enter the current millenium
set nocompatible

" enable plugins (for netrw)
filetype plugin on

" search down into sub folder
" provides tab completion for all file related tasks
set path+=**

" display all matching files when we tab complete
set wildmenu

" do not search in certain folders when matching files
set wildignore+=*/.git/**/*
set wildignore+=*/node_modules/**/*

" always show the status line
set laststatus=2

" turn on the ruler
set ruler

" turn on syntax highlighting
syntax on

" turn on search highlighting
set hlsearch

" turn on incremental search highlighting
set incsearch

" new lines inherit the indentation of previous lines
set autoindent

" convert tabs to spaces
set expandtab

" make tabs 4 spaces
set tabstop=4
set shiftwidth=4

" make tabs 2 spaces in various file types
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
autocmd FileType typescript setlocal tabstop=2 shiftwidth=2
autocmd FileType html setlocal tabstop=2 shiftwidth=2
autocmd FileType json setlocal tabstop=2 shiftwidth=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2
autocmd FileType java setlocal tabstop=2 shiftwidth=2

" enable line wrapping
set wrap

" set the window title to the current file
set title

" allow backspacing over various characters
set backspace=indent,eol,start

" confirm when closing unsaved files
set confirm

" delete comment characters when joining lines
set formatoptions+=j

" increase the undo limit
set history=1000

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it confusing.
set nrformats-=octal

" the number of screen lines to keep above and below the cursor
set scrolloff=5

" show partially input commands
set showcmd

" turn on line numbers
set number

" read externally changed files when un-suspending vim
set autoread

" save files when suspending (among other things)
set autowrite

" turn on the matchit plugin
packadd! matchit

" turn on spell checking
set spell spelllang=en_us

" disable the check for capital letters at the start of sentences / files
set spellcapcheck=""

" allow sharing of OSX and vim clipboards
set clipboard=unnamed

" keep the git gutter sign column always visible
set signcolumn=yes

" speed up the update time to make git gutter symbols show up quicker
set updatetime=100

" in git commit messages
"   turn off spell checking
"   hard wrap at 72 characters
"   color the column after the hard wrap
autocmd FileType gitcommmit set nospell
autocmd FileType gitcommmit set textwidth=72
autocmd FileType gitcommmit set colorcolumn=+1

" in git rebases
"   turn off spell checking
autocmd FileType gitrebase set nospell

" change the color of highlighted columns
highlight ColorColumn ctermbg=grey guibg=grey

" Make Y behave more like C and D
:map Y y$

" show whitespace characters as the following characters, use :set list to see
:set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

" Make v in netrw split to the right
let g:netrw_altv=1

" make vertical splitting the default for p previewing files
let g:netrw_preview=1

" when a preview window is open make it take 80% of the available columns
let g:netrw_winsize=80

" run prettier on save
autocmd BufWritePre *.js Neoformat
autocmd BufWritePre *.ts Neoformat
autocmd BufWritePre *.jsx Neoformat
autocmd BufWritePre *.tsx Neoformat
autocmd BufWritePre *.html Neoformat
autocmd BufWritePre *.css Neoformat
autocmd BufWritePre *.json Neoformat
autocmd BufWritePre *.java Neoformat

" mappings
nnoremap clg iconsole.log()<ESC>i
inoremap jk <ESC>
inoremap kj <ESC>
inoremap jkw <ESC>:w<CR>
inoremap kjw <ESC>:w<CR>
nnoremap : ;
nnoremap ; :

" vim-plug setup
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'preservim/nerdtree'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'sbdchd/neoformat'
Plug 'airblade/vim-gitgutter'

call plug#end()

" add NERDTree mappings
nnoremap <C-b> :NERDTreeToggle<CR>

" color the status line foreground (only use when using monokai)
" hi StatusLine ctermfg=58

" use our downloaded monokai colorscheme
" colorscheme monokai

" use our palenight plugin colorscheme
set background=dark
colorscheme palenight
let g:lightline = { 'colorscheme': 'palenight' }
let g:airline_theme = "palenight"

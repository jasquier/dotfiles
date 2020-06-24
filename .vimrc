" enter the current millenium
set nocompatible

" enable plugins (for netrw)
filetype plugin on

" search down into subfolder
" provides tab completion for all file related tasks
set path+=**

" display all matching files when we tab complete
set wildmenu

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

" enable line wrapping
set wrap

" show command line tab completion as a menu
set wildmenu

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

" enable spell checking
set spell

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it confusing.
set nrformats-=octal

" the number of screen lines to keep above and below the cursor
set scrolloff=5

" in git commit messages, let's make a hard wrap at 72 characters
autocmd FileType gitcommit set textwidth=72

" color the column after the hard wrap
autocmd FileType gitcommit set colorcolumn=+1

" change the color of highlighted columns
highlight ColorColumn ctermbg=grey guibg=grey


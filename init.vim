" Plugins that will be installed when doing a :PlugInstall
call plug#begin()

Plug 'pangloss/vim-javascript'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'kurkale6ka/vim-desertEX'
Plug 'preservim/nerdtree'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'sbdchd/neoformat'
Plug 'airblade/vim-gitgutter'
Plug 'rust-lang/rust.vim'

call plug#end()

" mappings
nnoremap clg iconsole.log()<ESC>i
"inoremap jk <ESC>
"inoremap kj <ESC>
"inoremap jkw <ESC>:w<CR>
"inoremap kjw <ESC>:w<CR>
nnoremap : ;
nnoremap ; :

" add NERDTree mappings
nnoremap <C-b> :NERDTreeToggle<CR>

" Setup and turn on colorscheme
set background=dark
colorscheme palenight
let g:lightline = { 'colorscheme': 'palenight' }
let g:airline_theme = "palenight"

" convert tabs to spaces
set expandtab

" make tabs 2 spaces in various file types
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
autocmd FileType typescript setlocal tabstop=2 shiftwidth=2
autocmd FileType html setlocal tabstop=2 shiftwidth=2
autocmd FileType json setlocal tabstop=2 shiftwidth=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2
autocmd FileType java setlocal tabstop=2 shiftwidth=2
autocmd FileType c setlocal tabstop=2 shiftwidth=2
autocmd FileType sh setlocal tabstop=2 shiftwidth=2

" make tabs 4 spaces in various file types
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4
autocmd FileType make setlocal tabstop=4 shiftwidth=4

" confirm when closing unsaved files
set confirm

" search down into sub folder
" provides tab completion for all file related tasks
set path+=**

" do not search in certain folders when matching files
set wildignore+=*/.git/**/*
set wildignore+=*/node_modules/**/*

" the number of screen lines to keep above and below the cursor
set scrolloff=5

" turn on line numbers
set number

" save files when suspending (among other things)
set autowrite

" allow sharing of OSX and vim clipboards
set clipboard=unnamed

" speed up the update time to make git gutter symbols show up quicker
set updatetime=100

" NB: The following autocmd is a kludge to get around the fact that the FileType plugin
" sets formatoptions after this vimrc thereby overwriting `set formatoptions` usage
"
" do not wrap comments on the next line
" do not insert comment leader after hitting O/o in normal mode
" do not insert comment leader after hitting enter in insert mode
autocmd FileType * set formatoptions-=cro

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

" show whitespace characters as the following characters, use :set list to see
:set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣,nbsp:+

" run NeoFormat on save
augroup fmt
        autocmd!
        autocmd BufWritePre * undojoin | Neoformat
augroup END

" Delete this after confirming the aboe augroup works
"autocmd BufWritePre *.js Neoformat
"autocmd BufWritePre *.ts Neoformat
"autocmd BufWritePre *.jsx Neoformat
"autocmd BufWritePre *.tsx Neoformat
"autocmd BufWritePre *.html Neoformat
"autocmd BufWritePre *.css Neoformat
"autocmd BufWritePre *.json Neoformat
"autocmd BufWritePre *.java Neoformat

" run rustfmt on save
let g:rustfmt_autosave = 1

" status bar colors
au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan

" Status line default
"set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

" Status Line Custom
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set laststatus=2
set noshowmode
set statusline=
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode
set statusline+=%1*\ %<%f%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %Y\                                 " FileType
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
set statusline+=\ (%{&ff})                               " FileFormat (dos/unix..)
set statusline+=%=                                       " Right Side
set statusline+=%2*\ col:\ %02v\                         " Colomn number
set statusline+=%3*│                                     " Separator
set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document
set statusline+=%0*\ %n\                                 " Buffer number

hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e

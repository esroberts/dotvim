" don't care about being vi-compatible
set nocompatible

" pathogen init
filetype off
execute pathogen#infect()
execute pathogen#helptags()

filetype plugin indent on

syntax on
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l/%L,%c%)\ %P

let mapleader = ","
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set nu
" searching
set ignorecase smartcase
set gdefault " replace all by default
" incremental search
set incsearch
set showmatch
set hlsearch
" clear search
nnoremap <leader><space> :noh<cr>
set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files

" line wrapping
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=81
hi ColorColumn ctermbg=17

" colorscheme
hi Search ctermfg=0 ctermbg=190
hi Folded ctermbg=0
hi DiffAdd    cterm=bold ctermbg=28
hi DiffDelete ctermbg=1 ctermfg=0
hi DiffChange cterm=bold ctermbg=3
hi DiffText   cterm=bold ctermbg=88
hi Pmenu ctermbg=238 gui=bold

" fix vim's stupid regexes
nnoremap / /\v
vnoremap / /\v

" folding, :help :folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
set foldignore=class

set list listchars=tab:»·,trail:·,eol:$
set nolist
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

"
" Configure plugins
"
" airline
source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_detect_paste=1
let g:airline_detect_modified=1
let g:airline_section_x='%{airline#util#prepend(airline#extensions#tagbar#currenttag(),0)}'
let g:airline_section_y=''
"let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled=1
let g:tmuxline_theme='nightly_fox'
"set encoding=utf-8
set t_Co=256
let g:airline_theme='wombat'
set laststatus=2

" pymode
" let g:pymode_python = 'disable'
" temporarily disable python mode to try jedi instead
let g:pymode = 0
let g:pymode_folding = 1
let g:pymode_lint = 1
let g:pymode_lint_cwindow = 0
let g:pymode_lint_ignore = "C301"
let g:pymode_doc = 0
let g:pymode_rope = 0

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:flake8_ignore="E501,E126,C301"

" NERDTree
map <C-n> :NERDTree<CR>

set wildignore+=*/.git/*
set wildmenu
set wildmode=list
"set autochdir
set wildignore=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif

set hlsearch

set path+=/usr/local/project/panama/**

" autocommands
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"key mappings
" more convenient escape to normal mode
" inoremap ; :
inoremap jj <ESC>
" vertical split
nnoremap <leader>w <C-w>v<C-w>l
" I don't actually know whwat these do anymore
nnoremap <tab> %
vnoremap <tab> %

" better split nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" don't use this much
nnoremap <leader>a :Ag 
map <leader>cw :close
" a quicker save
map <leader>s :w

nnoremap <leader>s :w<cr>
nnoremap <leader>rp :RainbowParenthesesToggle<cr>
nmap <leader>cs :close<cr>

nmap <leader>ev :e $MYVIMRC<cr>
nmap <leader>sv :source $MYVIMRC<cr>
nmap <leader>er :Errors<cr>
nmap <leader>gl :! git logo<cr>
nmap <leader>gs :Gstat<cr>
nmap <C-t> :CtrlPBufTag<cr>

"syntastic
"let g:syntastic_error_symbol='✗'
let g:syntastic_enable_highlighting=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_auto_loc_list=0
let g:syntastic_loc_list_height=5
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args = '--ignore="E501,E128"'

"gitgutter
highlight SignColumn ctermbg=0
nmap ]h :GitGutterNextHunk<cr>
nmap [h :GitGutterPrevHunk<cr>

"fugitive
nmap <leader>gs :Gstat<cr>
nmap <leader>gb :Gblame<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gD <c-w>h<c-w>c

"tagbar
nmap <leader>tb :TagbarToggle<cr>

function! SendKeys(args)
    execute tmux send-keys -t bottom './unit.sh a:args' C-m
endfunction

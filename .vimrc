" Enable pathogen plugin handler
" execute pathogen#infect()

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'alvan/vim-closetag'
Plugin 'ap/vim-buftabline'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'chr4/nginx.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'evidens/vim-twig'
Plugin 'gioele/vim-autoswap.git'
Plugin 'henrik/vim-indexed-search'
Plugin 'itchyny/lightline.vim'
Plugin 'itchyny/vim-gitbranch'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jparise/vim-graphql'
Plugin 'mattn/emmet-vim.git'
Plugin 'phpactor/phpactor'
Plugin 'prettier/vim-prettier'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'yggdroot/indentLine'
call vundle#end()

" Global settings
filetype plugin indent on
syntax on
set mouse=a " mouse support
set tabstop=4 " default tab length
set autoindent
set cindent
set expandtab
set shiftwidth=4
" set cul
set number relativenumber
set nu rnu
set timeoutlen=1000
set ttimeoutlen=0
set directory=~/.vim/.swp
set laststatus=2
set switchbuf=usetab,newtab
set exrc " project specific .vimrc
set hlsearch

" Mappings
let mapleader = ","
nnoremap <silent> ,<space> :nohlsearch<CR>
nnoremap <silent> <space>[ :bp<CR>
nnoremap <silent> <space>] :bn<CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>
vnoremap <C-s> <ESC>:w<CR>

" Tabs
hi TabLineFill ctermfg=Black ctermbg=Black
hi TabLineSel ctermfg=Green ctermbg=Black
hi TabLine ctermfg=Grey

" Abbreviations
ab diep die('<pre>'.print_r([<ESC>la,1<ESC>la.<ESC>$a;<ESC>F]i
ab phpclass <?php<CR><CR>class extends OtherClass<CR>{<CR>}<ESC>kkk_Ea
ab phpnclass <?php<CR><CR>namespace ;<CR><CR>class extends <CR>{<CR>}<ESC>kkk_Ea

" Cursor shape in different modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Hide netrw banner
let g:netrw_banner=0

" Left and right wrap to prev/next lines
set whichwrap+=<,>,h,l,[,]

" Hide current folder in netrw
let g:netrw_list_hide = '^\./$'
let g:netrw_hide = 1

" File type specific indenting
autocmd FileType sql setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType json setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType yml,yaml setlocal shiftwidth=2 tabstop=2 expandtab

" Show line numbers and relative in netrw
let g:netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'

" tmux cursor mode change
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Closetag plugin
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php'

" 256 colours
if !has('gui_running')
  set t_Co=256
endif

" Force :E to :Explore
command! E Explore

" :Q map to :q for fat fingers
command! Q quit

" Shift tab for insert mode
inoremap <S-Tab> <C-d>

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] " ignore file from .gitignore

" Statusbar
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" Fix php indenting
let g:PHP_vintage_case_default_indent = 1

" PHP namespace completed
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>


" PHP CS fixer
let g:php_cs_fixer_php_path = "/usr/bin/php"
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

set secure

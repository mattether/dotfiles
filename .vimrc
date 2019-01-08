"Enable pathogen plugin handler
execute pathogen#infect()

"Global settings
filetype plugin indent on
syntax on
set mouse=a
set tabstop=4
set autoindent
set cindent
set expandtab
set shiftwidth=4
"set cul
set number relativenumber
set nu rnu
set timeoutlen=1000
set ttimeoutlen=0
set directory=~/.vim/.swp
set laststatus=2
set switchbuf=usetab,newtab

"Tabs
hi TabLineFill ctermfg=Black ctermbg=Black
hi TabLineSel ctermfg=Green ctermbg=Black
hi TabLine ctermfg=Grey


"Abbreviations
ab diep die('<pre>'.print_r([],1).'</pre>');
ab phpclass <?php<CR><CR>class extends OtherClass<CR>{<CR>}<ESC>kkk_Ea
ab phpnclass <?php<CR><CR>namespace ;<CR><CR>class extends OtherClass<CR>{<CR>}<ESC>kkk_Ea

"Cursor shape in different modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"Hide netrw banner
let g:netrw_banner=0

"Left and right wrap to prev/next lines
set whichwrap+=<,>,h,l,[,]

"Hide current folder in netrw
let g:netrw_list_hide = '^\./$'
let g:netrw_hide = 1

"File type specific indenting
autocmd FileType sql setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2

"Show line numbers and relative in netrw
let g:netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'

"tmux cursor mode change
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

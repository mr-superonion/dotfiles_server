" Color setup"
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if has('termguicolors')
  set termguicolors
endif
set background=dark

" Color Setup"
let g:gruvbox_material_background = 'hard'
" let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 1
colorscheme gruvbox-material
let g:airline_theme= 'gruvbox_material'
" Cursor for insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
autocmd VimEnter * silent !echo -ne "\e[2 q"

" Move in command and input mode
set backspace=2
set backspace=indent,eol,start

" display airline
set cmdheight=1
set noshowmode   " to get rid of thing like --INSERT--
set noshowcmd    " to get rid of display of last command
set shortmess+=F " to get rid of the file name displayed in the command line bar

set exrc
set hidden
set noerrorbells
set scrolloff=8

" Display Line number
set relativenumber
set nu
set history=1000
set cursorline
hi CursorLine gui=underline guifg=254 guibg=254 cterm=underline ctermbg=None ctermfg=NONE

" Syntax
set showmatch
set guioptions=T
set hlsearch

" line
set nowrap
set colorcolumn=80
syntax on

" Split
set splitright
set splitbelow


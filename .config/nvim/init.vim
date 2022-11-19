set ttyfast
set mouse=a
" File system
filetype plugin indent on

" let vim-plug manage plugins
call plug#begin('~/.vim/plugged')
    " Editing
    Plug 'MattesGroeger/vim-bookmarks'
    Plug 'tpope/vim-commentary'
    Plug 'mr-superonion/vim-tmux-navigator'
    " Display
    Plug 'sainnhe/gruvbox-material'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'Yggdroot/indentLine'
    " autocomplete
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}
    Plug 'nvim-telescope/telescope-file-browser.nvim'
call plug#end()

" Color setup"
if has('termguicolors')
  set termguicolors
endif
set background=dark
" Color Setup -- gruvbox"
let g:gruvbox_material_background = 'hard'
" let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 1
colorscheme gruvbox-material
let g:airline_theme= 'gruvbox_material'

" vim-commentary
function UnmapCommentary()
  unmap gc
  nunmap gcc
endfunction
autocmd VimEnter * call UnmapCommentary()
xmap <leader>c  <Plug>Commentary
omap <leader>c  <Plug>Commentary
nmap <leader>cc <Plug>CommentaryLine

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

" Basic
" AutoIndent
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set nosmartindent
set inccommand=split
" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" AutoFile generation
set nobackup

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e
" Remember info about open buffers on close -------------- "
set viminfo^=%

runtime ./maps.vim
runtime ./tele.vim
runtime ./coc.vim
runtime ./menu.vim

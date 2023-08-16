set ttyfast
set mouse=a
" File system
filetype plugin indent on

" let vim-plug manage plugins
call plug#begin('~/.vim/plugged')
    " Editing
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

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" AutoFile generation
set nobackup
" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e
" Remember info about open buffers on close -------------- "
set viminfo^=%
set wrap

runtime ./maps.vim
runtime ./tele.vim
runtime ./coc.vim
runtime ./display.vim
runtime ./menu.vim

" Unused keys
nmap x <Nop>
nmap X <Nop>
nmap <A-h> <Nop>
nmap <A-l> <Nop>
nmap <C-b> <Nop>
nmap <C-f> <Nop>
nmap (( <Nop>
set ttyfast
set mouse=a

nnoremap <SPACE> <Nop>
let g:mapleader=" "
let maplocalleader = " "

" File system
filetype plugin indent on
call plug#begin('~/.vim/plugged')
" let vim-plug manage Vundle
    " Editing
    Plug 'MattesGroeger/vim-bookmarks'
    Plug 'tpope/vim-commentary'
    Plug 'mr-superonion/vim-tmux-navigator'
    " Display
    Plug 'sainnhe/gruvbox-material'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " autocomplete
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

" Substitute " Replace all is aliased to S.
nnoremap S :%s///g<Left><Left>
vnoremap // "zy/\V<C-R>=escape(@z,'/\')<CR><CR>

" Cursor for insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
autocmd VimEnter * silent !echo -ne "\e[2 q"
" Move in command and input mode
set backspace=2
set backspace=indent,eol,start

inoremap <C-N> <Nop>
inoremap <C-P> <Nop>

" Navigation:
nnoremap J 10<c-e>
nnoremap K 10<c-y>
nnoremap { {zz
nnoremap } }zz

" Wildmenu
cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"
" Search files and provide tab-completion for all file related tasks
set path+=**
" display all matching files when tab complete
set wildmenu
set wildmode=longest:full,full
let &wildcharm = &wildchar
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code
" display airline
set cmdheight=1
set noshowmode  " to get rid of thing like --INSERT--
set noshowcmd   " to get rid of display of last command
set shortmess+=F" to get rid of the file name displayed in the command line bar

" Basics
nnoremap Y y$
nnoremap yy Y
nnoremap V v$
nnoremap vv V

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

" Tab Control
nmap <ESC>h <Nop>
nmap <ESC>l <Nop>

" Window Control
nnoremap <C-w>" :wincmd =<CR>
nnoremap <C-w>= :new<CR>
nnoremap <C-w>% :vnew<CR>
nnoremap <C-w>x :q!<CR>
" Split
set splitright
set splitbelow
" Tabs
nnoremap <C-t> :tabnew<CR>
nnoremap L :tabnext<CR>
nnoremap H :tabprevious<CR>


" Basic
" AutoIndent
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set nosmartindent
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" AutoFile generation
set nobackup

" Copy and paste
" " Vim's auto indentation feature does not work properly with text copied
" from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>
set clipboard=unnamedplus
" Visual mode yank selected area to tmux paste buffer (clipboard)
vnoremap <Leader>y "zy:silent! call SendZBufferToHomeDotClipboard()<cr>
" Put from tmux clipboard
nnoremap <Leader>p :silent! call HomeDotClipboardPut()<cr>
function! SendZBufferToHomeDotClipboard()
    " Yank the contents buffer z to file ~/.clipboard and tmux paste buffer
    " For use with HomeDotClipboardPut()
    silent! redir! > ~/.clipboard
    silent! echon @z
    silent! redir END
endfunction
function! HomeDotClipboardPut()
    " Paste/Put the contents of file ~/.clipboard
    " For use with SendZBufferToHomeDotClipboard()
    exe 'let @z=""'
    silent! let @z = system("cat ~/.clipboard")
    " put the z buffer on the line below
    silent! norm "zp
endfunction

inoremap (( ()<Esc>i
inoremap [[ []<Esc>i
inoremap {{ {}<Esc>i
inoremap << <><Esc>i
inoremap '' ''<Esc>i
inoremap "" ""<Esc>i

" Spell
set spelllang=en
nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>
highlight SpellBad ctermfg=009 ctermbg=000 cterm=underline

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e
" Remember info about open buffers on close -------------- "
set viminfo^=%

" COC
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=number
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" show documentation in preview window.
inoremap <silent> <C-\> <C-r>=CocActionAsync('showSignatureHelp')<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

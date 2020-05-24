call plug#begin()
" themes
Plug 'chriskempson/base16-vim'

" feel
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

" shortcuts nd automation
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'cohama/lexima.vim' " Auto close parentesis
Plug 'ConradIrwin/vim-bracketed-paste' "only#if(!has('nvim'))
Plug 'coderifous/textobj-word-column.vim'
Plug 'preservim/nerdtree'
Plug 'thalesmello/webcomplete.vim'

" languages
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-go'
Plug 'ncm2/ncm2-jedi'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'lepture/vim-jinja'
Plug 'b4b4r07/vim-hcl'
Plug 'vimjas/vim-python-pep8-indent'
Plug 'vim-python/python-syntax'
Plug 'bps/vim-textobj-python'

" IaC
Plug 'hashivim/vim-terraform'
Plug 'pearofducks/ansible-vim'
Plug 'stephpy/vim-yaml'


" tmux
Plug 'tmux-plugins/vim-tmux'
Plug 'wellle/tmux-complete.vim'
Plug 'tmux-plugins/vim-tmux-focus-events', { 'tag': 'v1.0.0' }


call plug#end()

" set theme
set termguicolors
colorscheme base16-default-dark
let base16colorspace=256
let g:airline_theme= 'base16'
let g:airline#extensions#tabline#enabled = 1

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'c'    : ['#(whoami)', '#(~/.uptime.sh)'],
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['#(~/.cpu.sh)', '#(~/.load.sh)'],
      \'z'    : '#h'}

" ncm2 settings

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>

" ansible-vim settings
let g:ansible_yamlKeyName = 'yamlKey'
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'
let g:ansible_extra_keywords_highlight = 1

" nerdtree settings

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-b> :NERDTreeToggle<CR>

" vim-terraform settings

let g:terraform_align=1
let g:terraform_fmt_on_save=1

" Python
let g:python_highlight_all = 1

" vim shortcuts

set mouse=a           " Yes, mouse

" Allow CTRL+C/V/X/A operations
set clipboard=unnamedplus
source $VIMRUNTIME/mswin.vim
behave mswin


set ignorecase        " use case insensitive search
set smartcase         " except when using capital letters
set inccommand=split  " Interactive substitution using :%s
set number            " Print the line number in front of each line
set relativenumber    " Show the line number relative to the cursor
set hidden            " When off a buffer is unloaded when it is abandoned
set splitbelow        " Put the new window below the current one
set splitright        " Put the new window right of te current one
set lazyredraw        " Do not redrawn while executing commands that have not been typed


set smartindent       " Do smart autoindenting when starting a new line
set autoindent        " Copy indent from current line when starting a new line
set expandtab         " Use the appropriate number of spaces to insert a <Tab>
set tabstop=2         " Number of spaces that a <Tab> in the file counts for
set shiftwidth=2      " Number of spaces to use for each step of (auto)indent
set softtabstop=2     " Number of spaces that a <Tab> counts for in editing operations

set wildmenu          " Enhanced command line completio
set incsearch         " Vim will start searching as you type
set nowrap            " Stop wrapping long lines
set autoread          " Automatically reload buffers when file changes


" Enable persistent undo so that undo history persists across vim sessions
set undofile

" ignore stuff
set wildignore+=.git/,.gitkeep,*.BACKUP.*,*.BASE.*,*.LOCAL.*,*.REMOTE.*
set wildignore+=vendor/,coverage/,tmp/,*/tmp/*,*.so,*.swp,*.zip,log/
set wildignore+=backup/,*.sql,*.dump,*.tmp,*.min.js
set wildignore+=*.png,*.PNG,*.JPG,*.jpg,*.JPEG,*.jpeg,*.GIF,*.gif,*.pdf,*.PDF

let mapleader="\<space>"

nnoremap <silent> <leader>; A;<esc>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>F :Files ~<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>r :Rg<space>

" call sudo with w!!
cmap w!! w !sudo tee % >/dev/null

" yank from the cursor to the end of the line, to be consistent with C and D
nnoremap Y y$

" don't mess with wrap movement
nnoremap j gj
nnoremap k gk

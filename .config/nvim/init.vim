"#############################
"#      neovim config        #
"#############################
" Highlight cursor line
set cursorline
" Set relative line number
set number
set relativenumber
" Sets how many lines of history VIM has to remember
set history=500
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases 
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
" Enable syntax highlighting
syntax enable
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

"############################
"        Key Binding
"############################

" With a map leader it's possible to do extra key combinations
let mapleader = " "
" Fast saving
nmap <leader>w :w!<cr>
nmap <c-s> :w!<cr>

" Fast quiting
nmap <leader>q :wq!<cr>

" set encoder format (default is utf8)
noremap <leader>gb :edit ++enc=gb18030<cr>

" <esc> map to null
" inoremap <esc> <nop>

" map jk or kj to <esc> in insert mode
inoremap jk <esc>
inoremap kj <esc>

"     ^
"     k
" < h   l >
"     j
"     v

" keep cursor centered vertically on the screen
set scrolloff=999
" nnoremap j jzz
" nnoremap k kzz

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

map H <nop>
map J <nop>
map K <nop>
map L <nop>

map H 5h
map J 5j
map K 5k
map L 5l

" Smart way to move between windows
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>h <C-W>h
map <leader>l <C-W>l

map <leader>tc :tabclose<cr>
map <leader>tl :tabnext<cr>
map <leader>th :tabprevious<cr>
map <leader>tn :tabe<cr>

" set screen split
map si :set nosplitbelow<cr>:split<cr>
map sk :set splitbelow<cr>:split<cr>
map sj :set nosplitright<cr>:vsplit<cr>
map sl :set splitright<cr>:vsplit<cr>

" find word
noremap <c-f> *
" find next and set it middle line
noremap n nzz
" no highlight
nmap <silent> <leader><cr> :noh<cr>

call plug#begin('~/.vim/plugged')

" Theme
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'

" Tools
Plug 'luochen1990/rainbow'    " rainbow brackets
Plug 'jiangmiao/auto-pairs'   " auto complete brackets
Plug 'preservim/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf.vim'
Plug 'honza/vim-snippets'

call plug#end()

"############################
" -> Plugin Settings
"############################

""" NERD COMMENTER
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 2
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_java = 1 " Set a language to use its alternate delimiters by default
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } } " Add your own custom formats or override the defaults
let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1 " Enable NERDCommenterToggle to check all selected lines is commented or not 

""" onedark vim
colorscheme onedark
" true color support
set termguicolors

""" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<leader><C-a>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
let g:multi_cursor_quit_key            = 'jk'

""" easymotion
" map <Leader> <Plug>(easymotion-prefix)
nmap ss <Plug>(easymotion-s2)
" moving cursors across/over window

" <Leader>f{char} to move to {char}
map  <Leader>ss <Plug>(easymotion-bd-f)
nmap <Leader>ss <Plug>(easymotion-overwin-f2)
" s{char}{char} to move to {char}{char}
" nmap s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

""" lightline
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
    \ 'colorscheme': 'onedark'
    \ }

""" coc-vim
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" rainbow pairs config
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['DarkKhaki', 'Orchid', 'LightSkyBlue', 'SpringGreen'],
\	'ctermfgs': ['blue', 'yellow', 'cyan', 'magenta'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\	}
\}

" fzf.vim config
" Empty value to disable preview window altogether
let g:fzf_preview_window = ''

" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

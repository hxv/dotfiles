execute pathogen#infect()

" VIM SETTINGS

" enable syntax highlighting
syntax on

" use 4 spaces for indentation
set shiftwidth=4
set smarttab

" indent 4 spaces using tab
set tabstop=4
filetype indent on
filetype plugin on

" change tabs to spaces
set expandtab

" always show 5 lines above/below cursor
set so=5

" 'shortcut' key :)
let mapleader = ","
let g:mapleader = ","

" disable sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" highlight search results
set hlsearch
" realtime search highlight
set incsearch

" disable backup/swap files
set nobackup
set noswapfile
set nowb

" auto-indent, smart indent
set ai
set si

" wrap lines visually
set nowrap

" wrap lines in chosen places
set linebreak

" don't 'really' break lines
set textwidth=0
set wrapmargin=0

" remember cursor position in files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" use system keyboard
set clipboard=unnamedplus

" don't copy when deleting
nnoremap d "_d
vnoremap d "_d

" show line numbers
set nu relativenumber

set listchars=trail:·

set completeopt=longest,menuone

autocmd FileType scss setlocal iskeyword+=-,$,%,@
autocmd FileType typescript setlocal iskeyword+=-,$
autocmd FileType php setlocal iskeyword+=-,$
autocmd FileType html setlocal iskeyword+=-

set cursorline
set guicursor=

set conceallevel=0

" /VIM SETTINGS





" PLUGINS SETTINGS

" hide nerdtree after selecting file
let NERDTreeQuitOnOpen=1

" always show tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" emmed enabled only in insert mode, with binding Ctrl-E,
let g:user_emmet_mode='i'
let g:user_emmet_leader_key='<C-E>'

" open files from CtrlP in new buffer with Enter, or in current buffer with Ctrl-T
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("b")': ['<cr>'],
    \ }

let g:ctrlp_max_files = 50000
let g:ctrlp_working_path_mode = ''
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'results:100'
let g:ctrlp_user_command = 'P=%s; find "$P" -type f -not -wholename "$P/.git/*" -not -wholename "$P/vendor/*"'

" disable auto-save
let g:workspace_autosave = 0
let g:workspace_session_name = '.session.vim'
let g:workspace_persist_undo_history = 0

let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '¦'

" Code::Stats
" let g:codestats_api_key = ''
let g:airline_section_x = airline#section#create_right(['tagbar', 'filetype', '%{CodeStatsXp()}'])

" /PLUGINS SETTINGS





" FUNCTIONS

" hightlight word under cursor
function Hlw()
    exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '\/'))
endfunction

" toggle gitgutter/line numbers
function! H_num_switch()
    if &nu && &rnu
        set number
        set norelativenumber
    elseif &nu
        set nonumber
        set norelativenumber
    else
        set number
        set relativenumber
    endif

    if &nu
        GitGutterSignsEnable
        IndentGuidesToggle
    endif
endfunction

:command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | cw | redraw!

function! WriteSudo()
    :silent w !sudo tee %
    :e!
endfunction

:command W call WriteSudo()

" /FUNCTIONS





" SHORTCUTS / REMAPS

" fast save with ,w
nmap <leader>w :w!<cr>

" toggle paste mode with F2
set pastetoggle=<F2>

" highlight word under cursor using ,/
nmap <leader>/ :Ggr <cword><CR>
nmap <leader>? :Ggr ''<left>

" disable gitgutter/line numbers with F3
nnoremap <F3> :call H_num_switch()<CR>

" unindent line on Shift-Tab (in normal/insert mode)
nnoremap <S-Tab> i<C-d><Esc>
inoremap <S-Tab> <C-d>

" indent line on Tab (in normal mode)
nnoremap <Tab> :><cr>

" duplicate line on Ctrl-D (in normal/insert mode)
nnoremap <C-d> :t.<cr>
inoremap <C-d> <Esc>:t.<cr>i

" duplicate selection on Ctrl-D (in visual mode)
vnoremap <C-d> y'>pgv

" indent/unindent selected lines with Tab (in visual mode)
vnoremap <Tab> ><cr>gv
vnoremap <S-Tab> <<cr>gv

" scroll view using Ctrl-Up / Ctrl-Down (in normal/insert mode)
map <C-Down> <C-E>
map <C-Up> <C-Y>
imap <C-Down> <Esc><C-E>a
imap <C-Up> <Esc><C-Y>a

" open nerdtree with Alt-1 (in normal mode)
map <M-1> :NERDTreeToggle<CR>

" change splits with Ctrl-Alt-Left / Ctrl-Alt-Right / Ctrl-Alt-Up / Ctrl-Alt-Down (in normal mode)
nnoremap <C-M-Up> <C-W><Up>
nnoremap <C-M-Down> <C-W><Down>
nnoremap <C-M-Right> <C-W><Right>
nnoremap <C-M-Left> <C-W><Left>

" switch tabs with Alt-Left / Alt-Right (in normal/insert mode; switching in insert mode switches to normal mode)
nnoremap <M-Right> :tabnext<CR>
nnoremap <M-Left> :tabprevious<CR>
inoremap <M-Right> <Esc>:tabnext<CR>
inoremap <M-Left> <Esc>:tabprevious<CR>

" switch buffers with Alt-Up / Alt-Down (in normal/insert mode; switching in insert mode switches to normal mode)
nnoremap <M-Up> :bp!<CR>
nnoremap <M-Down> :bn!<CR>
inoremap <M-Up> <Esc>:bp!<CR>
inoremap <M-Down> <Esc>:bn!<CR>

" move lines up/down (in normal/insert/visual mode)
nnoremap <S-Up> :m .-2<cr>
nnoremap <S-Down> :m .+1<cr>
inoremap <S-Up> <Esc>:m .-2<CR>==gi
inoremap <S-Down> <Esc>:m .+1<CR>==gi
vnoremap <S-Up> :m '<-2<CR>gv=gv
vnoremap <S-Down> :m '>+1<CR>gv=gv

nnoremap <C-F> :call Hlw()<cr>

" close buffer with Ctrl-K
map <C-k> :bd<CR>

" popup menu
inoremap <expr> <CR>   pumvisible() ? '<C-y>' : '<CR>'
inoremap <expr> <Esc>  pumvisible() ? '<C-e>' : '<Esc>'
inoremap <expr> <C-p>  pumvisible() ? '<C-p>' : '<C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <Down> pumvisible() ? '<C-n>' : '<Down>'
inoremap <expr> <Up>   pumvisible() ? '<C-p>' : '<Up>'

vnoremap // y/<C-R>"<CR>N

nnoremap <C-w>o :only!<CR>

" Fugitive conflict resolution
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" highlighting lines
nnoremap <silent> <Leader>h :call matchadd('LineHighlight', '\%'.line('.').'l')<CR>
nnoremap <silent> <Leader>he :call matchadd('LineHighlightError', '\%'.line('.').'l')<CR>
nnoremap <silent> <Leader>hw :call matchadd('LineHighlightWarning', '\%'.line('.').'l')<CR>
nnoremap <silent> <Leader>hi :call matchadd('LineHighlightInfo', '\%'.line('.').'l')<CR>
nnoremap <silent> <Leader>hs :call matchadd('LineHighlightSuccess', '\%'.line('.').'l')<CR>

nnoremap <silent> <Leader>hc :call clearmatches()<CR>

" /SHORTCUTS / REMAPS





" COLOR_SCHEME

" 256 colors
set t_Co=256

" deus color scheme
set background=dark

" color scheme
colors deus

" /COLOR_SCHEME

" highlighted lines colors
hi LineHighlight ctermbg=240
hi LineHighlightError ctermbg=124
hi LineHighlightWarning ctermbg=166
hi LineHighlightInfo ctermbg=17
hi LineHighlightSuccess ctermbg=22


set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set tabstop=4
set expandtab
set shiftwidth=4
set omnifunc=syntaxcomplete#Complete
set autoindent
set hlsearch
set clipboard+=unnamedplus

set showcmd " Show partial command in status line
set showmatch " Show matching brackets
set ignorecase " Case insensitive searching
set smartcase " smart case matching
set incsearch " incremental search

set encoding=utf-8
set title
set titlestring=NVIM\ %f\ %m\ %r\ %y
let mapleader= "§"


:nnoremap _w :set columns==len(winlayout()[1])*90<CR><CR>=

if has('win32')
    " Remember to set env HOME to local dir
    let s:PlugDirectory='~/vimfiles/plugged'
else
    let s:PlugDirectory='~/.vim/plugged'
endif

call plug#begin(s:PlugDirectory)

Plug 'liuchengxu/graphviz.vim'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive' " breaks git by leaving locks .git/index.lock
Plug 'tpope/vim-abolish'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'dense-analysis/ale'
Plug 'flazz/vim-colorschemes'
Plug 'kien/ctrlp.vim'
Plug 'fatih/vim-go/', { 'do': ':GoUpdateBinaries' }
Plug 'sheerun/vim-polyglot' " fails if before fatih/vim-go
Plug 'Shougo/neocomplete.vim'
Plug 'majutsushi/tagbar'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'elmcast/elm-vim'
Plug 'mfukar/robotframework-vim'
Plug 'pechorin/any-jump.vim'
Plug 'cousine/go-present-slide-syntax.vim'
Plug 'Cian911/vim-cadence'
Plug 'felixhummel/setcolors.vim'
Plug 'tpope/vim-dadbod'

autocmd BufNewFile,BufRead *.solc Plug 'tomlion/vim-solidity'
call plug#end()

autocmd BufNewFile,BufRead *.solc set ft=solidity

colorscheme sandydune
autocmd BufNewFile,BufRead *.go colorscheme default

autocmd BufNewFile,BufRead *.gohtml set ft=gohtmltmpl

"local gui settings
"source $HOME/vimfiles/local_gui

" Any Jump
let g:any_jump_search_prefered_engine = 'rg'
hi Pmenu guibg=#1b1b1b ctermbg=Black
let g:any_jump_window_width_ratio  = 0.95
let g:any_jump_window_height_ratio = 0.95
let g:any_jump_window_top_offset   = 4

nmap <space> :NERDTreeToggle<CR>
nmap . :NERDTreeFocus<CR>
nmap ; :CtrlPBuffer<CR>
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme = 'dark'

let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.snippet_version=1
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['javascript'] = 'javascript,javascript-es6-react,javascript-react,javascriptreact'
let g:snipMate.scope_aliases['javascript-react'] = 'javascriptreact'
let g:snipMate.description_in_completion = 1
let g:snipMate.override = 1

let g:go_fmt_command = "goimports"

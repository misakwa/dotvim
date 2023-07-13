"Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" Improvement
set nocompatible

let mapleader=","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","

if has('vim_starting')
    " vim plugins
    source ~/.vim/plugs.vim
endif

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set number      "show line numbers

"display tabs and trailing spaces
" set list
set listchars=tab:▸\ ,eol:¬,trail:.,nbsp:.

set ignorecase  " Case insensitive search
set smartcase   " Guess casing if the keyword contains uppercase characters
set hls

set wrap        "dont wrap lines
set linebreak   "wrap lines at convenient points

set textwidth=120

if has ('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

"undo settings
if has("persistent_undo") && !exists('g:vscode')
    set undodir=$HOME/.undofiles
    set undofile
endif

if v:version >= 703
    set colorcolumn=+1 "mark the ideal max text width
endif

set cmdheight=2

"default indent settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set autoindent
set smartindent
set smarttab

"folding settings
set foldmethod=syntax   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash

set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
"set wildignore+=doc              " should not break helptags
set wildignore+=.git             " should not break clone
set wildignore+=.git/*             " should not break clone
set wildignore+=*/.git/*
set wildignore+=*/.hg/*
set wildignore+=*/.svn/*
"set wildignore+=*/.tox/*
set wildignore+=*.pyc,*.pyo
"set wildignore+=*/.*/*

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=8
set sidescrolloff=7
set sidescroll=1

set lazyredraw
set ttyfast

set laststatus=2
set showtabline=2

set tags=./.tags,.tags,./tags,./.vimtags,tags,vimtags

"fzf
let g:fzf_layout = { 'window': {'height': 0.7, 'width': 0.9 } }

"lsp setings
let g:lsp_settings = {
\ 'hie': {'cmd': ['hls', '--lsp']}
\}

"snipmate settings
let g:snips_author = ""
let g:snips_organization = ""

" Configure WhichKey
" Re-add after figuring out why UI is so terrible in my terminal
" if !exists('g:vscode')
"     autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map', 'n')
" endif

"dont load csapprox if we no gui support - silences an annoying warning
if !has("gui_running")
    let g:CSApprox_loaded = 1
endif

if !exists('g:vscode')
    set background=dark
    " if $ITERM_PROFILE =~ "Presentation"
    "     set background=light
    " else
    "     set background=dark
    " endif

    colorscheme solarized

    if has('gui_macvim')
        set transparency=5      " Make the window slightly transparent
    endif

    "Supertab
    set pumheight=25
    let g:SuperTabDefaultCompletionType = 'context'
    let g:SuperTabClosePreviewOnPopupClose = 1

endif

"map Q to something useful
noremap <silent> <buffer> Q gq

"make Y consistent with C and D
nnoremap <silent> <buffer> Y y$

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'svn\|commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

"spell check when writing commit logs
autocmd filetype svn,*commit* setlocal spell

if !exists('g:vscode')
    " Fugitive
    nnoremap <silent> <leader>gs <Cmd>Git<CR>
    nnoremap <silent> <localleader>ge <Cmd>Gedit<CR>
    nnoremap <silent> <localleader>gd <Cmd>Gdiff<CR>
    nnoremap <silent> <localleader>gc <Cmd>G commit<CR>
    nnoremap <silent> <localleader>gb <Cmd>Gblame<CR>
    nnoremap <silent> <leader>gl <Cmd>Gclog<CR>
    nnoremap <silent> <leader>gp <Cmd>Git push<CR>
    nnoremap <silent> <localleader>gw <Cmd>Gwrite<CR>:GitGutter<CR>
    nnoremap <silent> <localleader>gr <Cmd>Gread<CR>:GitGutter<CR>
    nnoremap <silent> <localleader>gg <Cmd>GitGutterToggle<CR>
endif

"Show cursorline in active window only
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave,FocusLost * setlocal nocursorline
augroup END

"Backup and swap, version control & undo
set nobackup
set noswapfile

" Better grep
if executable('rg')
    " Use rg over grep
    set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
elseif executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor\ --skip-vcs-ignores\ --follow\ --smart-case
endif

" GoldenView
let g:goldenview__enable_default_mapping = 0

" poetv
let g:poetv_auto_activate = 0
let g:poetv_set_environment = 1

" ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {}

if !exists('g:vscode')
    nmap <silent> <LocalLeader>ep <Plug>(ale_previous_wrap)
    nmap <silent> <LocalLeader>en <Plug>(ale_next_wrap)
endif

if executable('gopls')
    let g:ale_linters.go = ['gopls']
endif

let g:indent_guides_enable_on_vim_startup = 1

let g:EditorConfig_core_mode = 'external_command'
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

set hidden

if !exists('g:vscode')
    "load ftplugins and indent files
    filetype plugin indent on

    "turn on syntax highlighting
    syntax on

    "some stuff to get the mouse going in term
    set mouse=a
    "set ttymouse=xterm2

    "hide buffers when not displayed
    set hidden
endif

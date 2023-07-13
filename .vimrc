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

if !exists('g:vscode')
    " hight/unhighlight search
    nnoremap <silent> <C-l> <Cmd>set hls!<Cr>
    " Quick Horizontal splits
    nnoremap <silent> _ <Cmd>sp<cr>
    " | : Quick vertical splits
    nnoremap <silent> <bar> <Cmd>vsp<cr>
endif

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

set tags=./.tags,.tags,./tags,./.vimtags,tags,vimtags

if !exists('g:vscode')
    "load ftplugins and indent files
    filetype plugin indent on

    "turn on syntax highlighting
    syntax on

    let g:gutentags_ctags_tagfile='.tags'
    let g:gutentags_ctags_auto_set_tags = 0
    let g:gutentags_ctags_exclude_wildignore = 0

    let g:airline_experimental=1
    let g:airline_detect_modified=1
    let g:airline_detect_paste=1
    let g:airline_detect_spell=1
    let g:arline_powerline_fonts=0
    let g:airline#extensions#tmuxline#enabled=1
    let g:airline#extensions#tabline#enabled=1
    let g:airline#extensions#vista#enabled=1
    let g:airline#extensions#whitespace#enabled=1
    let g:airline#extensions#windowswap#enabled=1
    " let g:airline#extensions#tagbar#enabled=1
    " let g:airline#extensions#tagbar#flags='f'

    let g:tmuxline_theme='airline'
    let g:tmuxline_status_justify = 'center'
    let g:tmuxline_powerline_separators = 0

    "some stuff to get the mouse going in term
    set mouse=a
    "set ttymouse=xterm2

    "hide buffers when not displayed
    set hidden

endif

"fzf
let g:fzf_layout = { 'window': {'height': 0.7, 'width': 0.9 } }

if !exists('g:vscode')
    "tag browsing settings
    nnoremap <silent> <f3> <Cmd>Vista!!<cr>
    let g:vista_default_executive = 'vim_lsp'
    let g:vista_sidebar_width = 36
    let g:vista_close_on_jump = 1
    let g:vista#renderer#enable_icon = 0
endif

"lsp setings
let g:lsp_settings = {
\ 'hie': {'cmd': ['hls', '--lsp']}
\}

"snipmate settings
let g:snips_author = ""
let g:snips_organization = ""

if !exists('g:vscode')
    "nerdtree settings
    let g:NERDTreeMouseMode=2
    let g:NERDTreeWinSize=45
    let g:NERDTreeQuitOnOpen=1
    let g:NERDTreeChDirMode=1
    let g:NERDTreeRespectWildIgnore=1
    let g:NERDTreeCascadeOpenSingleChildDir=1
    let g:NERDTreeAutoDeleteBuffer=1
    let g:NETDTreeIgnore=['__pycache__', '.egg-info[[dir]]']
endif

" Tabular code alignment
if exists(':Tabularize')
    nmap <silent> <buffer> <LocalLeader>a& <Cmd>Tabularize /&<CR>
    vmap <silent> <buffer> <LocalLeader>a& <Cmd>Tabularize /&<CR>
    nmap <silent> <buffer> <LocalLeader>a= <Cmd>Tabularize /=<CR>
    vmap <silent> <buffer> <LocalLeader>a= <Cmd>Tabularize /=<CR>
    nmap <silent> <buffer> <LocalLeader>a: <Cmd>Tabularize /:<CR>
    vmap <silent> <buffer> <LocalLeader>a: <Cmd>Tabularize /:<CR>
    nmap <silent> <buffer> <LocalLeader>a:: <Cmd>Tabularize /:\zs<CR>
    vmap <silent> <buffer> <LocalLeader>a:: <Cmd>Tabularize /:\zs<CR>
    nmap <silent> <buffer> <LocalLeader>a, <Cmd>Tabularize /,<CR>
    vmap <silent> <buffer> <LocalLeader>a, <Cmd>Tabularize /,<CR>
    nmap <silent> <buffer> <LocalLeader>a<Bar> <Cmd>Tabularize /<Bar><CR>
    vmap <silent> <buffer> <LocalLeader>a<Bar> <Cmd>Tabularize /<Bar><CR>
endif

" Configure WhichKey
" Re-add after figuring out why UI is so terrible in my terminal
" if !exists('g:vscode')
"     autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map', 'n')
" endif

if !exists('g:vscode')

    " Searching
    nnoremap <silent> <c-p> <Cmd>Files<cr>
    nnoremap <silent> <c-f> <Cmd>Rg<cr>
    nnoremap <silent> <Leader>/ <Cmd>Ag<cr>
    nnoremap <silent> <Leader>/b <Cmd>Buffers<cr>
    nnoremap <silent> <Leader>/c <Cmd>Commits<cr>
    nnoremap <silent> <Leader>/bc <Cmd>BCommits<cr>
    nnoremap <silent> <Leader>/h <Cmd>History<cr>

    "explorer mappings
    nnoremap <silent> <f2> <Cmd>NERDTreeToggle<cr><Cmd>NERDTreeMirror<cr>
    nnoremap <silent> <f4> <Cmd>UndotreeToggle<cr>

    let g:undotree_SplitWidth = 60
    let g:undotree_DiffpanelHeight = 100
    let g:undotree_SetFocusWhenToggle=1
    let g:undotree_WindowLayout=1

    nnoremap <silent> <buffer> j gj
    nnoremap <silent> <buffer> k gk
    nnoremap <silent> <buffer> <leader>l <Cmd>set list!<cr>
    nnoremap <silent> <buffer> <space> za
    vnoremap <silent> <buffer> <space> za

endif

cmap <silent> w!! w !sudo tee % >/dev/null

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

    " Ultisnips behaviour
    inoremap <silent> <buffer> <C-X><C-K> <C-X><C-K>

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
"http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
"hacks from above (the url, not jesus) to delete fugitive buffers when we
"leave them - otherwise the buffer list gets polluted
"
"add a mapping on .. to view parent tree
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd BufReadPost fugitive://*
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif


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

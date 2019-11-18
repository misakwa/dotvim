"Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" Improvement
set nocompatible

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

set textwidth=79

if has ('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

"undo settings
if has("persistent_undo")
    set undodir=$HOME/.undofiles
    set undofile
endif

if v:version >= 703
    set colorcolumn=+1 "mark the ideal max text width
endif

" Cursor settings. This makes terminal vim sooo much nicer!
" Tmux will only forward escape sequences to the terminal if surrounded by a DCS
" sequence
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

let mapleader=","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","
set cmdheight=2

" Quick Horizontal splits
nnoremap _ :sp<cr>
" | : Quick vertical splits
nnoremap <bar> :vsp<cr>

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

"load ftplugins and indent files
filetype plugin indent on

set tags=./.tags,.tags,./tags,./.vimtags,tags,vimtags
let g:gutentags_ctags_tagfile='.tags'
let g:gutentags_ctags_auto_set_tags = 0
let g:gutentags_ctags_exclude_wildignore = 0

let g:arline_powerline_fonts=0
let g:airline#extensions#tmuxline#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tagbar#enabled=1
let g:airline#extensions#tagbar#flags='f'

let g:tmuxline_theme='airline'
let g:tmuxline_status_justify = 'center'
let g:tmuxline_powerline_separators = 0

"turn on syntax highlighting
syntax on

"some stuff to get the mouse going in term
set mouse=a
"set ttymouse=xterm2

"hide buffers when not displayed
set hidden

"tagbar settings
nnoremap <f3> :Vista!!<cr>
let g:vista_sidebar_width = 36
let g:vista_close_on_jump = 1
let g:vista#renderer#enable_icon = 0

"snipmate settings
let g:snips_author = ""
let g:snips_organization = ""

"nerdtree settings
let g:NERDTreeMouseMode=2
let g:NERDTreeWinSize=45
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeChDirMode=1
let g:NERDTreeRespectWildIgnore=1
let g:NERDTreeCascadeOpenSingleChildDir=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NETDTreeIgnore=['__pycache__', '.egg-info[[dir]]']

" Tabular
if exists(':Tabularize')
    nmap <Leader>a& :Tabularize /&<CR>
    vmap <Leader>a& :Tabularize /&<CR>
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a:: :Tabularize /:\zs<CR>
    vmap <Leader>a:: :Tabularize /:\zs<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    vmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
endif

"explorer mappings
nnoremap <silent> <f2> :NERDTreeToggle<cr>:NERDTreeMirror<cr>
nnoremap <silent> <f4> :UndotreeToggle<cr>

let g:undotree_SplitWidth = 60
let g:undotree_DiffpanelHeight = 100
let g:undotree_SetFocusWhenToggle=1
let g:undotree_WindowLayout=1

nnoremap j gj
nnoremap k gk
nnoremap <leader>l :set list!<cr>
nnoremap <space> za
vnoremap <space> za

cmap w!! w !sudo tee % >/dev/null

"dont load csapprox if we no gui support - silences an annoying warning
if !has("gui_running")
    let g:CSApprox_loaded = 1
    let g:yankring_enabled=0
endif

" GoldenView
" Remap to avoid collissions with mine
let g:goldenview__enable_default_mapping=0
nmap <silent> <Leader>vs <Plug>GoldenViewSplit
nmap <silent> <Leader>vm <Plug>GoldenViewSwitchWithLargest
nmap <silent> <Leader>vn <Plug>GoldenViewNext
nmap <silent> <Leader>vp <Plug>GoldenViewPrevious

if $ITERM_PROFILE =~ "Presentation"
   set background=light
else
    set background=dark
endif

colorscheme solarized

if has('gui_macvim')
    set transparency=5      " Make the window slightly transparent
endif

" start: YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_goto_buffer_command = 'new-or-existing-tab'
" start: Make ycm play nice with supertab
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_auto_trigger = 1
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
" eo: Make ycm play nice with supertab

" language servers - lsp
let g:ycm_language_server = []
if executable('rls')
    let g:ycm_language_server +=  [{'name': 'rust', 'cmdline': ['rls'], 'filetypes': ['rust', 'rs']}]
endif
" eo: language servers - lsp

" eo: YouCompleteMe

" Ultisnips behaviour
inoremap <C-X><C-K> <C-X><C-K>

"Supertab
set pumheight=25
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ["s:ContextText", "s:ContextDiscover"]
let g:SuperTabContextTextOmniPrecedence = ["&omnifunc", "&completefunc"]
let g:SuperTabContextDiscoverDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-u>"]
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabRetainCompletionDuration = 'completion'

"map Q to something useful
noremap Q gq

"make Y consistent with C and D
nnoremap Y y$

"visual search mappings
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>


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

"Hightlight repeated lines
function! s:HighlightRepeats() range
  let lineCounts = {}
  let lineNum = a:firstline
  while lineNum <= a:lastline
    let lineText = getline(lineNum)
    if lineText != ""
      let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
    endif
    let lineNum = lineNum + 1
  endwhile
  exe 'syn clear Repeat'
  for lineText in keys(lineCounts)
    if lineCounts[lineText] >= 2
      exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
    endif
  endfor
endfunction
command! -range=% HighlightRepeats <line1>,<line2>call <SID>HighlightRepeats()

" Cleanup whitespaces and preserve state
" http://vimcasts.org/episodes/tidying-whitespace/
function! s:StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nnoremap <silent> <leader>$ :call <SID>StripTrailingWhitespaces()<CR>

" Like windo but restore the current window.
function! s:WinDo(command)
  let currwin=winnr()
  execute 'windo ' . a:command
  execute currwin . 'wincmd w'
endfunction
com! -nargs=+ -complete=command Windo call <SID>WinDo(<q-args>)

" Like bufdo but restore the current buffer.
function! s:BufDo(command)
  let currBuff=bufnr("%")
  execute 'bufdo ' . a:command
  execute 'buffer ' . currBuff
endfunction
com! -nargs=+ -complete=command Bufdo call <SID>BufDo(<q-args>)

" Like tabdo but restore the current tab.
function! s:TabDo(command)
  let currTab=tabpagenr()
  execute 'tabdo ' . a:command
  execute 'tabn ' . currTab
endfunction
com! -nargs=+ -complete=command Tabdo call <SID>TabDo(<q-args>)

"spell check when writing commit logs
autocmd filetype svn,*commit* setlocal spell

"scrollbind all windows shortcut
nnoremap <silent> <Leader>ww :Windo :set scb!<CR>

" Fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
nnoremap <silent> <leader>gr :Gread<CR>:GitGutter<CR>
nnoremap <silent> <leader>gg :GitGutterToggle<CR>
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

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --skip-vcs-ignores\ --follow\ --smart-case
endif

" ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {}

if executable('gopls')
    let g:ale_linters.go = ['gopls']
endif

let g:indent_guides_enable_on_vim_startup = 1

let g:EditorConfig_core_mode = 'external_command'
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

set hidden

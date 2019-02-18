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

set tags=./.tags,./tags,./.vimtags,tags,vimtags
let g:gutentags_ctags_tagfile='.tags'

let g:arline_powerline_fonts=0
let g:airline#extensions#tmuxline#enabled=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep='»'
let g:airline_right_sep='«'
let g:airline_symbols.branch='⎇'
let g:airline_theme='dark'

let g:tmuxline_theme='airline'
" let g:tmuxline_powerline_separators=0
let g:tmuxline_separators = {
\ 'left': '',
\ 'left_alt': '»',
\ 'right': '',
\ 'right_alt': '«',
\ 'space': ' '}

"turn on syntax highlighting
syntax on

"some stuff to get the mouse going in term
set mouse=a
"set ttymouse=xterm2

"hide buffers when not displayed
set hidden

"statusline setup
set statusline =%#identifier#
set statusline+=[%t]    "tail of the filename
set statusline+=%*

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype

"read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

"modified flag
set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*

"Lazy load fugitive statusline if plugin installed
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%{StatuslineTrailingSpaceWarning()}

set statusline+=%{StatuslineLongLineWarning()}

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")

        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction


"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        endif
    endif
    return b:statusline_tab_warning
endfunction

"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")

        if !&modifiable
            let b:statusline_long_line_warning = ''
            return b:statusline_long_line_warning
        endif

        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                        \ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)
    let line_lens = map(getline(1,'$'), 'len(substitute(v:val, "\\t", spaces, "g"))')
    return filter(line_lens, 'v:val > threshold')
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction

"tagbar settings
nnoremap <f3> :TagbarToggle<cr>
let g:tagbar_autoclose = 1
let g:tagbar_width = 36
let g:tagbar_autofocus = 1

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

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_goto_buffer_command = 'new-or-existing-tab'
" Make ycm play nice with supertab
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_auto_trigger = 1
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
" eo: Make ycm play nice with supertab

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

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:airline#extensions#ale#enabled=1

let g:indent_guides_enable_on_vim_startup = 1

let g:EditorConfig_core_mode = 'external_command'
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Denite everything
nnoremap <silent> <C-p> :Denite file/rec<cr>
nnoremap <silent> <leader>/ :Denite grep<cr>
if executable('ag')
    call denite#custom#var('file/rec', 'command',
        \ ['ag', '--nogroup', '--nocolor', '-f', '--smart-case', '-g', ''])

    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
    call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--smart-case', '-f', '--nocolor'])
endif
" eo: Denite everything

" Denite menus
let s:menus = {}
let s:menus.edit = { 'description': 'Find...' }
let s:menus.edit.command_candidates = [
        \ ['Find > File', 'Denite file/rec'],
        \ ['Find > Buffer', 'Denite buffer'],
        \ ['Find > Text', 'Denite grep'],
    \]

call denite#custom#var('menu', 'menus', s:menus)
nnoremap <silent> <leader>m :Denite menu<cr>

" eo: Denite menus

set hidden

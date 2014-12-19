"Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" Improvement
set nocompatible

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle'))
    " vim plugins
    source ~/.vim/neobundles.vim
    " Prompt to instal new plugins
    NeoBundleCheck
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store lots of :cmdline history
set history=1000

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set number      "show line numbers

"display tabs and trailing spaces
"set list
set listchars=tab:▸\ ,eol:¬,trail:.,nbsp:.

set ignorecase  " Case insensitive search

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set wrap        "dont wrap lines
set linebreak   "wrap lines at convenient points

set textwidth=79

if has ('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

if v:version >= 703
    "undo settings
    set undodir=~/.vim/undofiles
    set undofile

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

set encoding=utf-8

" Quick Horizontal splits
nnoremap _ :sp<cr>
" | : Quick vertical splits
nnoremap <bar> :vsp<cr>

"default indent settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

"Ruby indent settings
"autocmd Filetype ruby setlocal sts=2 sw=2 expandtab

"folding settings
set foldmethod=syntax   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches

set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=doc              " should not break helptags
set wildignore+=.git             " should not break clone
set wildignore+=.git/*             " should not break clone
set wildignore+=*/.git/*
set wildignore+=*/.hg/*
set wildignore+=*/.svn/*
set wildignore+=*/.tox/*
set wildignore+=*/.*/*

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=8
set sidescrolloff=7
set sidescroll=1

"load ftplugins and indent files
filetype plugin indent on

" Supertab Completion
let g:SuperTabSetDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = '<c-x><c-o>'
let g:SuperTabContextDiscoverDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-u>"]

set tags=./.tags,./tags,./.vimtags,tags,vimtags
let g:easytags_async = 1
let g:easytags_python_enabled = 1
let g:easytags_dynamic_files = 1
" let g:easytags_python_languages = {
"         \   'php': {
"         \       'cmd': g:easytags_cmd,
"         \       'args': []
"         \
"         \
"         \
"         \   }
" }

let g:arline_powerline_fonts = 0
let g:airline#extensions#tmuxline#enabled = 0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_symbols.branch = '⎇'

let g:tmuxline_theme = 'powerline'
let g:tmuxline_powerline_separators = 0
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

"tell the term has 256 colors
set t_Co=256

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

set statusline+=%{fugitive#statusline()}

"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%{StatuslineTrailingSpaceWarning()}

set statusline+=%{StatuslineLongLineWarning()}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

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
let g:tagbar_autoclose = 1
let g:tagbar_width = 36
let g:tagbar_autofocus = 1
"let g:tagbar_compact = 1


"snipmate settings
let g:snips_author = ""
let g:snips_organization = ""

"nerdtree settings
let g:NERDTreeMouseMode=2
let g:NERDTreeWinSize=30
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeChDirMode=1

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
nnoremap <f2> :NERDTreeToggle<cr>:NERDTreeMirror<cr>
nnoremap <f3> :TagbarToggle<cr>
nnoremap <f4> :GundoToggle<cr>

let g:gundo_width = 60
let g:gundo_preview_height = 100
"let g:gundo_right = 1
"let g:gundo_preview_bottom = 1
"let g:gundo_preview_statusline = 1

nnoremap j gj
nnoremap k gk
nnoremap <leader>l :set list!<cr>

cmap w!! w !sudo tee % >/dev/null

"dont load csapprox if we no gui support - silences an annoying warning
"disable golden ratio for gui mode
if has("gui_running")
    let g:loaded_golden_ratio=1
else
    let g:CSApprox_loaded = 1
    let g:yankring_enabled=0
endif

if $ITERM_PROFILE =~ "light"
   set background=light
else
    set background=dark
endif

if has('gui_macvim')
    set transparency=5      " Make the window slightly transparent
endif
"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

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

"spell check when writing commit logs
autocmd filetype svn,*commit* setlocal spell

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
"leave them - otherwise the buffer list gets poluted
"
"add a mapping on .. to view parent tree
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd BufReadPost fugitive://*
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif


let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized


"Show cursorline in active window only
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave,FocusLost * setlocal nocursorline
augroup END

"Backup and swap, version control & undo
set nobackup
set noswapfile

" CtrlP
let g:ctrp_cmd = 'CtrlPMixed'
let g:ctrlp_max_height = 40
let g:ctrlp_lazy_update = 350
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/]\.(git|hg|svn|tox|.*)$',
\ 'file': '\v\.(exe|so|dll|pyc|DS_Store)$',
\ }

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache but we're still going to
  " cache
  let g:ctrlp_max_files = 0
endif
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_use_caching = 1

let g:ack_use_dispatch = 1

"Golden Ratio
"let g:loaded_golden_ratio=1
"let g:golden_ratio_autocommand=1

" Omni Completion
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
    \	if &omnifunc == "" |
    \		setlocal omnifunc=syntaxcomplete#Complete |
    \	endif
endif

" Configure browser for haskell_doc.vim
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

nnoremap <silent> <LocalLeader>$ :call vimrc#StripTrailingWhiteSpaces()<CR>

" Execute command in window and restore current window
com! -nargs=+ -complete=command Windo call vimrc#WinDo(<q-args>)

" Execute command in buffer and restore current buffer
com! -nargs=+ -complete=command Bufdo call vimrc#BufDo(<q-args>)

" Execute command in tab and restore current tab
com! -nargs=+ -complete=command Tabdo call vimrc#TabDo(<q-args>)

"scrollbind all windows shortcut
nnoremap <silent> <LocalLeader>ww :Windo :set scb!<CR>

" Highlight repeated words under cursor
command! -range=% HighlightRepeats <line1>,<line2>call vimrc#HighlightRepeats()

" hight/unhighlight search
nnoremap <silent> <C-l> <Cmd>set hls!<Cr>
" Quick Horizontal splits
nnoremap <silent> _ <Cmd>sp<cr>
" | : Quick vertical splits
nnoremap <silent> <bar> <Cmd>vsp<cr>

" Bubber navigation
nnoremap <silent> <buffer> j gj
nnoremap <silent> <buffer> k gk
nnoremap <silent> <buffer> <localleader>l <Cmd>set list!<cr>
nnoremap <silent> <buffer> <space> za
vnoremap <silent> <buffer> <space> za

" force write a file opened without sudo
cmap <silent> w!! w !sudo tee % >/dev/null

" Ultisnips behaviour
inoremap <silent> <buffer> <C-X><C-K> <C-X><C-K>

"map Q to something useful
noremap <silent> <buffer> Q gq

"make Y consistent with C and D
nnoremap <silent> <buffer> Y y$


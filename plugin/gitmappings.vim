" Fugitive
" Git status
nnoremap <silent> <leader>gs <Cmd>Git<CR>

" Edit a commit
nnoremap <silent> <localleader>ge <Cmd>Gedit<CR>

" Diff
nnoremap <silent> <localleader>gd <Cmd>Gdiff<CR>

" Commit staged files
nnoremap <silent> <localleader>gc <Cmd>G commit<CR>

" Show buffer blame
nnoremap <silent> <localleader>gb <Cmd>Gblame<CR>

" Show commit logs
nnoremap <silent> <leader>gl <Cmd>Git log --oneline<CR>

" Push committed changes
nnoremap <silent> <leader>gp <Cmd>Git push<CR>

" Write a file to git/stage a file for commit
nnoremap <silent> <localleader>gw <Cmd>Gwrite<CR>:GitGutter<CR>

" Unstage a file or read file at HEAD commit and reset git gutter
nnoremap <silent> <localleader>gr <Cmd>Gread<CR>:GitGutter<CR>

" Toggle git gutter
nnoremap <silent> <localleader>gg <Cmd>GitGutterToggle<CR>

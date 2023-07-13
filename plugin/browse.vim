"nerdtree settings
let g:NERDTreeMouseMode=2
let g:NERDTreeWinSize=45
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeChDirMode=1
let g:NERDTreeRespectWildIgnore=1
let g:NERDTreeCascadeOpenSingleChildDir=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NETDTreeIgnore=['__pycache__', '.egg-info[[dir]]']

let g:undotree_SplitWidth = 60
let g:undotree_DiffpanelHeight = 100
let g:undotree_SetFocusWhenToggle=1
let g:undotree_WindowLayout=1
"
" ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {}

if executable('gopls')
    let g:ale_linters.go = ['gopls']
endif

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

" Browse through errors
nmap <silent> <LocalLeader>ep <Plug>(ale_previous_wrap)
nmap <silent> <LocalLeader>en <Plug>(ale_next_wrap)

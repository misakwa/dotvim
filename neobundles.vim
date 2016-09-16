" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Interactive command execution
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" Vim defaults
NeoBundle 'tpope/vim-sensible'

"NeoBundle 'Shougo/unite.vim'

" Core Plugins
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'scrooloose/syntastic'

" File browsing
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'mbbill/undotree'

" Status line
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'edkolev/tmuxline.vim'

" Version control
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-scripts/vcscommand.vim'
NeoBundle 'airblade/vim-gitgutter'

" Code Helpers
NeoBundle "tpope/vim-commentary"
NeoBundleLazy 'godlygeek/tabular', {'autoload':{'commands':'Tabularize'} }

" Colours
NeoBundle 'godlygeek/csapprox'
NeoBundle 'altercation/vim-colors-solarized'

NeoBundle 'mileszs/ack.vim'

" Auto-completion
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'ervandew/supertab'
"NeoBundle 'joonty/vdebug.git'

NeoBundle 'vim-scripts/IndexedSearch'
NeoBundle 'vim-scripts/delimitMate.vim'
"NeoBundle 'roman/golden-ratio'
NeoBundle 'zhaocai/GoldenView.Vim'

if executable('ctags')
    NeoBundle 'majutsushi/tagbar'
    NeoBundle 'ludovicchabant/vim-gutentags'
endif


" Syntax Plugins
NeoBundle 'vim-scripts/matchit.zip', {'rtp': 'matchit.zip'}
NeoBundleLazy 'mattn/emmet-vim', {
\'autoload': {'filetypes':['tpl', 'html','php','phtml','xml','xsl','xslt','xsd','css','sass','scss','less','mustache'] }
\}
NeoBundleLazy 'gregsexton/MatchTag', {
\ 'autoload': {'filetypes': ['html', 'xml', 'xsl', 'xslt', 'xsd'] }
\}
NeoBundleLazy 'solarnz/thrift.vim', {
\ 'autoload': { 'filetypes': ['thrift'] }
\}
NeoBundleLazy 'groenewege/vim-less', {
\ 'autoload': { 'filetypes': ['less', 'css'] }
\}
NeoBundleLazy 'derekwyatt/vim-scala', {
\ 'autoload': { 'filetypes': ['scala', 'java'] }
\}
NeoBundleLazy 'mikelue/vim-maven-plugin', {
\ 'autoload': {'filetypes': ['scala', 'java']}
\}
NeoBundleLazy 'nvie/vim-flake8', {
\ 'autoload': { 'filetypes': ['python'] }
\}
NeoBundleLazy 'jmcantrell/vim-virtualenv', {
\ 'autoload': {'filetypes': ['python']}
\}
NeoBundleLazy 'tpope/vim-ragtag', {
\ 'autoload': { 'filetypes': ['html','xml','xsl','xslt','xsd', 'mustache'] }
\}
NeoBundleLazy 'tpope/vim-markdown', {
\ 'autoload': { 'filetypes': ['markdown'] }
\}
NeoBundleLazy 'vim-ruby/vim-ruby', {
\ 'autoload': {'filetypes': ['ruby'] }
\}
NeoBundleLazy 'tpope/vim-rails', {
\ 'autoload': {'filetypes': ['ruby'] }
\}
NeoBundleLazy 'kchmck/vim-coffee-script', {
\ 'autoload': {'filetypes': ['coffee'] }
\}
NeoBundleLazy 'rodjek/vim-puppet', {
\ 'autoload': {'filetypes': ['puppet'] }
\}
NeoBundleLazy 'bitc/vim-hdevtools', {
\ 'autoload': {'filetypes': ['haskell']}
\}
NeoBundleLazy 'eagletmt/ghcmod-vim', {
\ 'autoload': { 'filetypes': ['haskell'] }
\}
NeoBundleLazy 'neovimhaskell/haskell-vim', {
\ 'autoload': {'filetypes': ['haskell']}
\}
NeoBundleLazy 'enomsg/vim-haskellConcealPlus', {
\ 'autoload': {'filetypes': ['haskell']}
\}
NeoBundleLazy 'eagletmt/ghcmod-vim', {
\ 'autoload': {'filetypes': ['haskell']}
\}
NeoBundleLazy 'eagletmt/neco-ghc', {
\ 'autoload': {'filetypes': ['haskell']}
\}
NeoBundleLazy 'Twinside/vim-hoogle', {
\ 'autoload': {'filetypes': ['haskell']}
\}
NeoBundleLazy 'fatih/vim-go', {
\ 'autoload': {'filetypes': ['go'] }
\}
NeoBundleLazy 'rust-lang/rust.vim', {
\ 'autoload': {'filetypes': ['rust', 'rs'] }
\}
NeoBundleLazy 'mxw/vim-jsx', {
\ 'autoload': {'filetypes': ['javascript', 'jsx']}
\}

" erlang syntax files
NeoBundleLazy 'vim-erlang/vim-erlang-runtime', {
\ 'autoload': {'filetypes': ['erlang', 'erl']}
\}
NeoBundleLazy 'vim-erlang/vim-erlang-compiler', {
\ 'autoload': {'filetypes': ['erlang', 'erl']}
\}
NeoBundleLazy 'vim-erlang/vim-erlang-omnicomplete', {
\ 'autoload': {'filetypes': ['erlang', 'erl']}
\}
NeoBundleLazy 'vim-erlang/vim-erlang-tags', {
\ 'autoload': {'filetypes': ['erlang', 'erl']}
\}

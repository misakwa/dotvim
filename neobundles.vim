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

"NeoBundle 'Shougo/unite.vim'

" Core Plugins
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'scrooloose/syntastic'

" File browsing
"NeoBundle 'wincent/command-t'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'sjl/gundo.vim'

" Status line
NeoBundle 'bling/vim-airline'
NeoBundle 'edkolev/tmuxline.vim'

" Version control
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-scripts/vcscommand.vim'
NeoBundle 'airblade/vim-gitgutter'

NeoBundle 'scrooloose/nerdcommenter'

NeoBundle 'godlygeek/csapprox'
NeoBundleLazy 'godlygeek/tabular', {'autoload':{'commands':'Tabularize'} }

NeoBundle 'altercation/vim-colors-solarized'

NeoBundle 'mileszs/ack.vim'

NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'ervandew/supertab'

"NeoBundle 'joonty/vdebug.git'

NeoBundle 'vim-scripts/IndexedSearch'
NeoBundle 'vim-scripts/delimitMate.vim'
NeoBundle 'vim-scripts/golden-ratio'

if executable('ctags')
    NeoBundle 'majutsushi/tagbar'
    NeoBundle 'xolox/vim-easytags'
    NeoBundle 'xolox/vim-misc'
endif


" Syntax Plugins
NeoBundle 'vim-scripts/matchit.zip', {'rtp': 'matchit.zip'}
NeoBundleLazy 'mattn/emmet-vim', {
\'autoload': {'filetypes':['html','xml','xsl','xslt','xsd','css','sass','scss','less','mustache'] }
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
\ 'autoload': { 'filetypes': ['scala'] }
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
NeoBundleLazy 'lukerandall/haskellmode-vim', {
\ 'autoload': {'filetypes': ['haskell']}
\}
NeoBundleLazy 'eagletmt/ghcmod-vim', {
\ 'autoload': { 'filetypes': ['haskell'] }
\}
NeoBundleLazy 'fatih/vim-go', {
\ 'autoload': {'filetypes': ['go'] }
\}

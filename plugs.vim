call plug#begin('~/.vim/plugs')

" Vim defaults
Plug 'tpope/vim-sensible'

" Core Plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'w0rp/ale'

" File browsing
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'

" Version control
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/vcscommand.vim'
Plug 'airblade/vim-gitgutter'

" Code Helpers
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'nathanaelkane/vim-indent-guides'

" Colours
Plug 'godlygeek/csapprox'
Plug 'altercation/vim-colors-solarized'

Plug 'mileszs/ack.vim', { 'on': 'Ack' }

" Auto-completion
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
"Plug 'joonty/vdebug.git'

Plug 'vim-scripts/IndexedSearch'
Plug 'vim-scripts/delimitMate.vim'
"Plug 'roman/golden-ratio'
Plug 'zhaocai/GoldenView.Vim'

if executable('ctags')
    Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
    Plug 'xolox/vim-easytags'
    Plug 'xolox/vim-misc'
endif


" Syntax Plugins
Plug 'vim-scripts/matchit.zip', {'rtp': 'matchit.zip'}
Plug 'mattn/emmet-vim', { 'for': ['tpl', 'html','php','phtml','xml','xsl','xslt','xsd','css','sass','scss','less','mustache'] }
Plug 'gregsexton/MatchTag', { 'for': ['html', 'xml', 'xsl', 'xslt', 'xsd'] }
Plug 'solarnz/thrift.vim', { 'for': ['thrift'] }
Plug 'groenewege/vim-less', { 'for': ['less', 'css'] }
Plug 'derekwyatt/vim-scala', { 'for': ['scala', 'java'] }
Plug 'mikelue/vim-maven-plugin', { 'for': ['scala', 'java'] }
Plug 'nvie/vim-flake8', { 'for': ['python'] }
Plug 'jmcantrell/vim-virtualenv', { 'for': ['python'] }
Plug 'tpope/vim-ragtag', { 'for': ['html','xml','xsl','xslt','xsd', 'mustache'] }
Plug 'tpope/vim-markdown', { 'for': ['markdown'] }
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby'] }
Plug 'tpope/vim-rails', { 'for': ['ruby'] }
Plug 'kchmck/vim-coffee-script', { 'for': ['coffee'] }
Plug 'rodjek/vim-puppet', { 'for': ['puppet'] }
Plug 'bitc/vim-hdevtools', { 'for': ['haskell'] }
Plug 'eagletmt/ghcmod-vim', { 'for': ['haskell'] }
Plug 'neovimhaskell/haskell-vim', { 'for': ['haskell'] }
Plug 'enomsg/vim-haskellConcealPlus', { 'for': ['haskell'] }
Plug 'eagletmt/ghcmod-vim', { 'for': ['haskell'] }
Plug 'eagletmt/neco-ghc', { 'for': ['haskell'] }
Plug 'Twinside/vim-hoogle', { 'for': ['haskell'] }
Plug 'fatih/vim-go', { 'for': ['go'], 'do': ':GoInstallBinaries' }
Plug 'nsf/gocode', { 'do': './vim/symlink.sh', 'for': 'go', 'rtp': 'vim' }
Plug 'rust-lang/rust.vim', { 'for': ['rust', 'rs'] }
Plug 'racer-rust/vim-racer', { 'for': ['rust', 'rs'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'jsx'] }

" erlang syntax files
Plug 'vim-erlang/vim-erlang-runtime', { 'for': ['erlang', 'erl'] }
Plug 'vim-erlang/vim-erlang-compiler', { 'for': ['erlang', 'erl'] }
Plug 'vim-erlang/vim-erlang-omnicomplete', { 'for': ['erlang', 'erl'] }
Plug 'vim-erlang/vim-erlang-tags', { 'for': ['erlang', 'erl'] }

" jinja2 syntax
Plug 'Glench/Vim-Jinja2-Syntax', { 'for': ['jinja', 'jinja2', 'j2'] }

call plug#end()

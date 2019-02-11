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
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'
Plug 'Shougo/denite.nvim'

" File browsing
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

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
Plug 'Yggdroot/indentLine'

" Colours
Plug 'godlygeek/csapprox'
Plug 'altercation/vim-colors-solarized'

Plug 'mileszs/ack.vim', { 'on': 'Ack' }

" Auto-completion
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'joonty/vdebug.git'

Plug 'vim-scripts/IndexedSearch'
Plug 'Raimondi/delimitMate'
Plug 'zhaocai/GoldenView.Vim'
Plug 'valloric/youcompleteme', {'do': 'TERM=xterm ./install --all', 'frozen': 1}

if executable('ctags')
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
endif


" Syntax Plugins
Plug 'vim-scripts/matchit.zip', {'rtp': 'matchit.zip'}
Plug 'mattn/emmet-vim', { 'for': ['tpl', 'html','php','phtml','xml','xsl','xslt','xsd','css','sass','scss','less','mustache'] }
" Plug 'gregsexton/MatchTag', { 'for': ['html', 'xml', 'xsl', 'xslt', 'xsd'] }
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
Plug 'isruslan/vim-es6', { 'for': ['javascript', 'es6'] }
Plug 'leafgarland/typescript-vim', { 'for': ['javascript', 'typescript', 'es6']}

" erlang syntax files
Plug 'vim-erlang/vim-erlang-runtime', { 'for': ['erlang', 'erl', 'elixir', 'ex', 'exs', 'eex'] }
Plug 'vim-erlang/vim-erlang-compiler', { 'for': ['erlang', 'erl', 'elixir', 'ex', 'exs', 'eex'] }
Plug 'vim-erlang/vim-erlang-omnicomplete', { 'for': ['erlang', 'erl', 'elixir', 'ex', 'exs', 'eex'] }
Plug 'vim-erlang/vim-erlang-tags', { 'for': ['erlang', 'erl', 'elixir', 'ex', 'exs', 'eex'] }
Plug 'elixir-editors/vim-elixir', { 'for': ['erlang', 'erl', 'elixir', 'ex', 'exs', 'eex'] }
Plug 'slashmili/alchemist.vim', { 'for': ['erlang', 'erl', 'elixir', 'ex', 'exs', 'eex'] }
Plug 'posva/vim-vue', { 'for': ['vue'] }

" jinja2 syntax
Plug 'Glench/Vim-Jinja2-Syntax', { 'for': ['jinja', 'jinja2', 'j2'] }

call plug#end()

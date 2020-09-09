call plug#begin('~/.vim/plugs')

" Vim defaults
Plug 'tpope/vim-sensible'

" Core Plugins
Plug 'tpope/vim-surround'

Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'

Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'

" Auto-completion
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'liuchengxu/vista.vim'

" File browsing
Plug 'junegunn/fzf', { 'do': 'yes \| ./install --bin' }
Plug 'junegunn/fzf.vim', { 'on': ['Buffers', 'Files', 'Rg', 'Ag', 'Commits', 'BCommits', 'History'] }

Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/IndexedSearch'

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

Plug 'Raimondi/delimitMate'
Plug 'zhaocai/GoldenView.Vim'
Plug 'ervandew/supertab'


" Syntax Plugins
Plug 'andymass/vim-matchup'
Plug 'solarnz/thrift.vim', { 'for': ['thrift'] }
Plug 'groenewege/vim-less', { 'for': ['less', 'css'] }
Plug 'derekwyatt/vim-scala', { 'for': ['scala', 'java', 'gradle'] }
Plug 'mikelue/vim-maven-plugin', { 'for': ['scala', 'java', 'gradle'] }
Plug 'udalov/kotlin-vim', { 'for': ['kotlin', 'kt', 'gradle'] }
Plug 'psf/black', { 'branch': 'stable', 'for': ['python'] }
Plug 'petobens/poet-v', { 'for': ['python'] }
Plug 'cespare/vim-toml', { 'for': ['toml'] }
Plug 'mattn/emmet-vim', { 'for': ['tpl', 'html','php','phtml','xml','xsl','xslt','xsd','css','sass','scss','less','mustache'] }
Plug 'gregsexton/MatchTag', { 'for': ['html', 'xml', 'xsl', 'xslt', 'xsd', 'jsx'] }
Plug 'tpope/vim-ragtag', { 'for': ['html','xml','xsl','xslt','xsd', 'mustache'] }
Plug 'tpope/vim-markdown', { 'for': ['markdown'] }
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby'] }
Plug 'tpope/vim-rails', { 'for': ['ruby'] }
Plug 'kchmck/vim-coffee-script', { 'for': ['coffee'] }
Plug 'rodjek/vim-puppet', { 'for': ['puppet'] }

" Haskell syntax files
Plug 'neovimhaskell/haskell-vim', { 'for': ['haskell'] }

" golang syntax files
Plug 'fatih/vim-go', { 'for': ['go'], 'do': ':GoUpdateBinaries' }

" rust syntax files
Plug 'rust-lang/rust.vim', { 'for': ['rust', 'rs'] }

" javascript syntax files
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'typescript', 'es6', 'jsx', 'ts', 'js', 'tsx']}
Plug 'leafgarland/typescript-vim', { 'for': ['javascript', 'typescript', 'es6', 'ts', 'js', 'jsx', 'tsx']}
Plug 'peitalin/vim-jsx-typescript', { 'for': ['javascript', 'typescript', 'js', 'ts', 'jsx', 'tsx', 'es5', 'es6'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'jsx', 'js', 'ts', 'es6', 'tsx'] }
Plug 'isruslan/vim-es6', { 'for': ['javascript', 'es6', 'ts', 'js', 'jsx', 'tsx'] }
Plug 'google/vim-jsonnet', { 'for': ['jsonnet'] }

" erlang syntax files
Plug 'vim-erlang/vim-erlang-runtime', { 'for': ['erlang', 'erl', 'elixir', 'ex', 'exs', 'eex'] }
Plug 'vim-erlang/vim-erlang-compiler', { 'for': ['erlang', 'erl', 'elixir', 'ex', 'exs', 'eex'] }
Plug 'vim-erlang/vim-erlang-omnicomplete', { 'for': ['erlang', 'erl', 'elixir', 'ex', 'exs', 'eex'] }
Plug 'vim-erlang/vim-erlang-tags', { 'for': ['erlang', 'erl', 'elixir', 'ex', 'exs', 'eex'] }
Plug 'elixir-editors/vim-elixir', { 'for': ['erlang', 'erl', 'elixir', 'ex', 'exs', 'eex'] }
Plug 'slashmili/alchemist.vim', { 'for': ['erlang', 'erl', 'elixir', 'ex', 'exs', 'eex'] }

" VueJS Syntax
Plug 'posva/vim-vue', { 'for': ['vue'] }

" jinja2 syntax
Plug 'Glench/Vim-Jinja2-Syntax', { 'for': ['jinja', 'jinja2', 'j2', 'html', 'xml', 'phtml', 'mustache'] }

" sql uppercase keywords
Plug 'alcesleo/vim-uppercase-sql', { 'for': ['sql'] }

" Dart syntax + flutter
Plug 'dart-lang/dart-vim-plugin', { 'for': ['dart'] }
" Plug 'misakwa/vim-ycm-dart'
Plug 'thosakwe/vim-flutter', { 'for': ['dart'], 'on': ['FlutterRun', 'FlutterQuit', 'FlutterVsplit',
    \ 'FlutterTab', 'FlutterHotReload', 'FlutterHotRestart', 'FlutterDevices', 'FlutterSplit',
    \'FlutterEmilators', 'FlutterEmulatorLaunch'] }

call plug#end()

call plug#begin('~/.vim/plugs')

" Vim defaults
Plug 'tpope/vim-sensible'

" Core Plugins
Plug 'tpope/vim-surround'

Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'

if !exists('g:vscode')
    Plug 'editorconfig/editorconfig-vim'
    Plug 'w0rp/ale'
    " Plug 'roxma/vim-hug-neovim-rpc'
    " Plug 'roxma/nvim-yarp'
    Plug 'wesQ3/vim-windowswap'
    " Plug 'mg979/vim-visual-multi'
endif


if !exists('g:vscode')
    " Auto-completion
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'liuchengxu/vista.vim'
endif

" File browsing
if !exists('g:vscode')
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim', { 'on': ['Buffers', 'Files', 'Rg', 'Ag', 'Commits', 'BCommits', 'History'] }
endif

Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/IndexedSearch'

if !exists('g:vscode')
    Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
endif

" Status line
if !exists('g:vscode')
    Plug 'vim-airline/vim-airline'
    Plug 'edkolev/tmuxline.vim'
endif

" Version control
if !exists('g:vscode')
    Plug 'tpope/vim-fugitive'
    Plug 'vim-scripts/vcscommand.vim'
    Plug 'airblade/vim-gitgutter'
endif

" Code Helpers
if !exists('g:vscode')
    Plug 'tpope/vim-commentary'
    Plug 'Yggdroot/indentLine'
endif

Plug 'godlygeek/tabular', { 'on': 'Tabularize' }

" Colours
if !exists('g:vscode')
    Plug 'godlygeek/csapprox'
    Plug 'altercation/vim-colors-solarized'
endif

if !exists('g:vscode')
    Plug 'Raimondi/delimitMate'
    Plug 'zhaocai/GoldenView.Vim'

    Plug 'ervandew/supertab'
endif

if !exists('g:vscode')
    " Syntax Plugins
    Plug 'andymass/vim-matchup'
    Plug 'groenewege/vim-less', { 'for': ['less', 'css'] }
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

    " Terraform
    Plug 'hashivim/vim-terraform'
    Plug 'juliosueiras/vim-terraform-completion', { 'for': ['terraform', 'tf', 'hcl'] }

    " JVM Languages
    Plug 'derekwyatt/vim-scala', { 'for': ['scala', 'java', 'gradle'] }
    Plug 'mikelue/vim-maven-plugin', { 'for': ['scala', 'java', 'gradle'] }
    " Plug 'bazelbuild/vim-bazel', { 'for': ['java', 'scala', 'python', 'c', 'c++', 'objc']}
    Plug 'udalov/kotlin-vim', { 'for': ['kotlin', 'kt', 'gradle'] }

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
endif

" Dart syntax + flutter
if !exists('g:vscode')
    Plug 'dart-lang/dart-vim-plugin', { 'for': ['dart'] }
    " Plug 'misakwa/vim-ycm-dart'
    Plug 'thosakwe/vim-flutter', { 'for': ['dart'], 'on': ['FlutterRun', 'FlutterQuit', 'FlutterVsplit',
        \ 'FlutterTab', 'FlutterHotReload', 'FlutterHotRestart', 'FlutterDevices', 'FlutterSplit',
        \'FlutterEmilators', 'FlutterEmulatorLaunch'] }
endif

call plug#end()

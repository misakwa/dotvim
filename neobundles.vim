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

" original repos on github
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-unimpaired'

" version control
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-scripts/vcscommand.vim'

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'scrooloose/nerdcommenter'

NeoBundle 'godlygeek/csapprox'
NeoBundle 'godlygeek/tabular'

NeoBundle 'altercation/vim-colors-solarized'

NeoBundle 'mileszs/ack.vim'

NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'

if executable('ctags')
    NeoBundle 'majutsushi/tagbar'
    NeoBundle 'xolox/vim-easytags'
endif

NeoBundle 'gregsexton/MatchTag'

NeoBundle 'ervandew/supertab'

NeoBundle 'mattn/emmet-vim'

NeoBundle 'xolox/vim-misc'

"NeoBundle 'joonty/vdebug.git'

" vim-scripts
NeoBundle 'vim-scripts/IndexedSearch'
NeoBundle 'vim-scripts/delimitMate.vim'
NeoBundle 'vim-scripts/matchit.zip', {'rtp': 'matchit.zip'}
NeoBundle 'vim-scripts/golden-ratio'

" Syntax
NeoBundle 'solarnz/thrift.vim'
NeoBundle 'groenewege/vim-less'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'nvie/vim-flake8'
NeoBundle 'tpope/vim-ragtag'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'rodjek/vim-puppet'
NeoBundle 'lukerandall/haskellmode-vim'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'fatih/vim-go'

NeoBundle 'jmcantrell/vim-virtualenv'

NeoBundle 'scrooloose/syntastic'

" File browsing
NeoBundle 'kien/ctrlp.vim'
"NeoBundle 'wincent/command-t'
NeoBundle 'fholgado/minibufexpl.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'terryma/vim-multiple-cursors'

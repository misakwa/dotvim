set nocompatible

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" original repos on github
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-ragtag'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-unimpaired'

NeoBundle 'airblade/vim-gitgutter'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'

NeoBundle 'godlygeek/csapprox'
NeoBundle 'godlygeek/tabular'

NeoBundle 'vim-ruby/vim-ruby'

NeoBundle 'altercation/vim-colors-solarized'

NeoBundle 'mileszs/ack.vim'

NeoBundle 'kchmck/vim-coffee-script'

NeoBundle 'SirVer/ultisnips'

if executable('ctags')
    NeoBundle 'majutsushi/tagbar'
endif

NeoBundle 'gregsexton/MatchTag'

NeoBundle 'fholgado/minibufexpl.vim'

NeoBundle 'ervandew/supertab'

"NeoBundle 'mattn/zencoding-vim'
NeoBundle 'mattn/emmet-vim'

NeoBundle 'rodjek/vim-puppet'

NeoBundle 'kien/ctrlp.vim'

NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-easytags'
" vim-scripts
NeoBundle 'vim-scripts/vcscommand.vim'
NeoBundle 'vim-scripts/IndexedSearch'
NeoBundle 'vim-scripts/delimitMate.vim'
NeoBundle 'vim-scripts/matchit.zip', {'rtp': 'matchit.zip'}
NeoBundle 'vim-scripts/golden-ratio'

filetype plugin indent on
NeoBundleCheck

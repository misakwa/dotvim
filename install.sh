#!/usr/bin/env sh
# Update submodule to retrieve neobundle
git submodule init && git submodule update

# Link vimrc
d=`pwd`
ln -s $d ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc

# Remove lingering link
rm dotvim

vim -u neobundles.vim +NeoBundleInstall! +NeoBundleClean! +qall

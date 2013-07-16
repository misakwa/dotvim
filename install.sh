#!/usr/bin/env sh
# Update submodule to retrieve neobundle
git submodule init && git submodule update

# Link vimrc
d=`pwd`
ln -s $d ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc

vim -u neobundles.vim +NeoBundleInstall! +NeoBundleClean! +qall

exit(0)

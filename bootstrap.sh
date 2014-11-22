#!/usr/bin/env sh
# Update submodule to retrieve neobundle
git submodule init && git submodule update

# Link vimrc
rm $HOME/.vimrc
ln -s $HOME/.vim/vimrc $HOME/.vimrc

#!/usr/bin/env sh
# Update submodule to retrieve neobundle
git submodule update --init --recursive

# Link vimrc
rm $HOME/.vimrc
ln -s $HOME/.vim/vimrc $HOME/.vimrc

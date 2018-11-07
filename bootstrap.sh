#!/usr/bin/env sh
# Update submodule to retrieve neobundle
git submodule update --init --recursive

# Backup .vimrc
if [ -f $HOME/.vimrc ]; then
    backup_file=$HOME/.vimrc-backup-$(date +%s)
    echo "Copying contents of $HOME/.vimrc to $backup_file"
    cp -L $HOME/.vimrc $backup_file
fi

# Link .vimrc
rm -f $HOME/.vimrc
ln -s $HOME/.vim/vimrc $HOME/.vimrc

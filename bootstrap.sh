#!/usr/bin/env sh

# Backup .vimrc
if [ -f $HOME/.vimrc ]; then
    backup_file=$HOME/.vimrc-backup-$(date +%s)
    echo "Copying contents of $HOME/.vimrc to $backup_file"
    cp -L $HOME/.vimrc $backup_file
fi

# Link .vimrc
rm -f $HOME/.vimrc
ln -s $HOME/.vim/.vimrc $HOME/.vimrc

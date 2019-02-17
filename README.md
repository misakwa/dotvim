# dotvim

Vim configuration accumulated

###### Bootstrapping

Backup your .vim and .vimrc settings and clone repo to ~/.vim

```bash
$ git clone git@github.com:misakwa/dotvim.git ~/.vim
```

Install [Universal Ctags](https://github.com/universal-ctags/ctags)

* [Mac Homebrew install instructions](https://github.com/universal-ctags/homebrew-universal-ctags)

Run the bootstrap script.

**Please remember to backup your .vimrc file before running this script**
```bash
$ cd ~/.vim
$ ./bootstrap.sh
```

Run :PlugInstall after firing up vim to install all plugins.

Follow instructions [YouCompleteMe Instructions](https://github.com/Valloric/YouCompleteMe#installation) to install automatic completion since it fails automatic installation.

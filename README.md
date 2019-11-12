# Terminal Customization
## Vim
Use command below to create a symbolic link from this git repository.
```
ln -s directory/to/dot-files/.vim $HOME
```
```
ln -s directory/to/dotfiles/.vimrc $HOME
```
If a .vimrc or .vim/ already exists, 
you can add -f flag to remove the old file and create the symlink or else there can be a conflict.

(*) Note that vim version has to be at least vim 8, this customization is not tested on Neovim or Macvim.
## Bash
Symlink the files the same way above. Bash version needs to be 4 or above for the customized error message to work.
## Iterm 2 colorscheme
I am using a modified version of the monokai colorscheme. Use it with minimal + compact theme for better experience.

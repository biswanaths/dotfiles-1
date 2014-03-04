#!/bin/zsh
# NOTE: Not tested enough.

# Symlink vim stuff
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
mkdir -p ~/.vim/backup/undo

# Zsh
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zsh ~/.zsh

# Tmux
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

# Weechat
ln -s ~/dotfiles/.weechat ~/.weechat

# User scripts
ln -s ~/dotfiles/bin ~/.bin

# Install required apps
brew install zsh && brew install vim --HEAD --with-perl --with-lua --override-system-vi

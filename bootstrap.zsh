#!/bin/zsh
# NOTE: Not tested enough.

# Set up Quicklook stuff
defaults write com.apple.Finder QLEnableTextSelection -bool true

# Symlink vim stuff
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
mkdir -p ~/.vim/backup/undo

# Zsh
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zsh ~/.zsh

# Tmux
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

# Tig
ln -s ~/dotfiles/.tigrc ~/.tigrc

# Slate
ln -s ~/dotfiles/.slate ~/.slate

# Weechat
ln -s ~/dotfiles/.weechat ~/.weechat

# User scripts
ln -s ~/dotfiles/bin ~/.bin

# Install required apps
if [[ -x /usr/local/bin/brew ]]; then
    brew install zsh && brew install vim --HEAD --with-perl --with-lua --override-system-vi
else
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    brew install zsh && brew install vim --HEAD --with-perl --with-lua --override-system-vi
fi

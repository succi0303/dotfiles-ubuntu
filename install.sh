#!/bin/bash -e

# Install dotfiles

IGNORE_PATTERN="^\.(git)"
DOTDIR="$( cd "$( dirname "$0" )" && pwd )"

echo "START create dotfile links."
for dotfilepath in $DOTDIR/.??*; do
    DOTFILE="$(basename $dotfilepath)"
    [[ $DOTFILE =~ $IGNORE_PATTERN ]] && continue
    ln -snfv "$dotfilepath" "$HOME/$DOTFILE"
done
echo "END create dotfile links."

# Install apt packages

apt-install() {
  echo "Install $@"
  sudo apt install -y "$@"
}
sudo apt update && sudo apt upgrade -y

apt-install cargo
apt-install cmake # need to build starship
apt-install tig
apt-install tmux

# colorscheme (base16)
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# Rust tools
#cargo install --version 1.20.1 starship # ~>1.21.0 needs rust v1.80.0 or newer

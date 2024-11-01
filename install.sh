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

apt-install tig
apt-install tmux
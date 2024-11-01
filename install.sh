#!bin/bash -e

IGNORE_PATTERN="^\.(git)"
DOTDIR="$( cd "$( dirname "$0" )" && pwd )"

echo "START create dotfile links."
for dotfile in $DOTDIR/.??*; do
  [[ $dotfile =~ $IGNORE_PATTERN ]] && continue
  ln -snfv "$(pwd)/$dotfile" "$HOME/$dotfile"
done
echo "END create dotfile links."
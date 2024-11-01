#!bin/bash -e

IGNORE_PATTERN="^\.(git)"

echo "START create dotfile links."
for dotfile in .??*; do
  [[ $dotfile =~ $IGNORE_PATTERN ]] && continue
  ln -snfv "$(pwd)/$dotfile" "$HOME/$dotfile"
done
echo "END create dotfile links."
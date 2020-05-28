#!/bin/bash

echo "Copying dotfiles from ~ to ."
cp -f /Users/jasquier/.bash_profile .
cp -f /Users/jasquier/.editorconfig .
cp -f /Users/jasquier/.gitconfig .
cp -f /Users/jasquier/.vimrc .

echo "Updating contents of brew-list.txt"
date > brew-list.txt
brew desc $(brew list) >> brew-list.txt


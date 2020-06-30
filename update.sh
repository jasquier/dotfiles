#!/bin/bash

echo "Copying dotfiles from ~ to ."
cp -f /Users/jasquier/.bash_profile .
cp -f /Users/jasquier/.editorconfig .
cp -f /Users/jasquier/.gitconfig .
cp -f /Users/jasquier/.vimrc .
cp -f /Users/jasquier/.githooks/* .githooks/
cp -f /Users/jasquier/Library/Preferences/com.googlecode.iterm2.plist .

echo "Updating contents of brew-list.txt"
brew desc $(brew list) >brew-list.txt
brew cask list -1 >>brew-list.txt

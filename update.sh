#!/bin/bash

echo "Copying dotfiles from ~ to ."
cp -f /Users/jasquier/.bash_profile ./bash
cp -f /Users/jasquier/.bash_aliases ./bash
cp -f /Users/jasquier/.bash_functions ./bash
cp -f /Users/jasquier/.bash_completions ./bash
cp -f /Users/jasquier/.bash_commands ./bash
cp -f /Users/jasquier/.editorconfig .
cp -f /Users/jasquier/.gitconfig .
cp -f /Users/jasquier/.vimrc .
cp -f /Users/jasquier/.config/nvim/init.vim .
cp -f /Users/jasquier/.vim/colors/monokai.vim .vim/colors/
cp -f /Users/jasquier/.sqliterc .
cp -f /Users/jasquier/.githooks/* .githooks/
cp -f /Users/jasquier/Library/Preferences/com.googlecode.iterm2.plist .

echo "Updating contents of brew-list.txt"
brew desc $(brew list --formula) >brew-list.txt
brew list --cask -1 >>brew-list.txt

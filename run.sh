#!/bin/bash

dotfilesDir=`pwd`/dotfiles
ls -B dotfiles | while read filename; do
  if [ $filename != 'run.sh' ]; then
    rm -r $HOME/.$filename
    ln -s $dotfilesDir/$filename $HOME/.$filename
  fi
done
echo "dotfiles copied"
echo

rm -f $HOME/.sources
ln -s `pwd`/sources/ $HOME/.sources
echo "sources copied"
echo

rm -f $HOME/.bin
ln -s `pwd`/bin/ $HOME/.bin
echo "bin copied"
echo

rm "$HOME/Library/Application Support/Code/User/settings.json"
ln -s `pwd`/vscode_settings.json "$HOME/Library/Application Support/Code/User/settings.json"

mkdir -p $HOME/code/
mkdir -p $HOME/.tasks

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
echo "brew installed"
echo

brew install emacs
echo "emacs installed"
echo

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
echo "nvm installed"
echo
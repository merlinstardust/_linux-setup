#!/bin/bash

dotfilesDir=`pwd`/dotfiles
ls -B dotfiles | while read filename; do
  if [ $filename != 'run.sh' ]; then
    ln -fs $dotfilesDir/$filename $HOME/.$filename
  fi
done
echo "dotfiles copied"

rm -f $HOME/.sources
ln -s `pwd`/sources/ $HOME/.sources
echo "sources copied"

rm -f $HOME/.bin
ln -s `pwd`/bin/ $HOME/.bin
mv $HOME/bin $HOME/.bin
echo "bin copied"

ln -s `pwd`/vscode_settings.json "$HOME/Library/Application Support/Code/User/settings.json"

mkdir -p $HOME/code/
mkdir -p $HOME/.tasks

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install emacs

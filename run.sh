#!/bin/bash

dotfilesDir=`pwd`/dotfiles
ls -B dotfiles | while read filename; do
  if [ $filename != 'run.sh' ]; then
    ln -fs $dotfilesDir/$filename $HOME/.$filename
  fi
done
echo "dotfiles copied"

rm -f $HOME/.sources
ln -s `pwd`/sources/ $HOME/
mv $HOME/sources $HOME/.sources
echo "sources copied"

rm -f $HOME/.bin
ln -s `pwd`/bin/ $HOME/
mv $HOME/bin $HOME/.bin
echo "bin copied"

mkdir -p $HOME/code/
mkdir -p $HOME/.todos

# install programs
# sudo apt-get install -y emacs

# TODOs
# meteor
# atom
# python history
# mongo
# chrome

# look at wget -qO- URL | sh
# test with bitly

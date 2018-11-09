#!/bin/bash

dotfilesDir=`pwd`/dotfiles
ls -B dotfiles | while read filename; do
  if [ $filename != 'run.sh' ]; then
    ln -fs $dotfilesDir/$filename $HOME/.$filename
  fi
done
ln -frs ssh_config $HOME/.ssh/config
echo "dotfiles copied"

ln -rs sources/ $HOME/.sources/
echo "sources copied"

ln -rs secrets/ $HOME/.secrets/

ln -rs bin/ $HOME/.bin/
echo "bin copied"

mkdir -p $HOME/code/
mkdir -p $HOME/.todos

# install programs
sudo apt-get install -y emacs

# TODOs
# meteor
# atom
# python history
# mongo
# chrome

# look at wget -qO- URL | sh
# test with bitly

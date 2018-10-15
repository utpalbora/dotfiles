#!/bin/bash

sudo apt-get install -fmy vim git build-essential gcc g++ cmake autoconf libtool automake make m4 flex bison gawk python python3 clang-format clang llvm 

if ! test -d ~/.vim/bundle/Vundle.vim; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
cp .vimrc ~/.vimrc
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe & python3 ~/.vim/bundle/YouCompleteMe/install.py --clang-completer
cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py

#!/bin/bash

if ! test -d ~/.vim/bundle/Vundle.vim; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
cp .vimrc ~/.vimrc
vim +PluginInstall +qall
cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py

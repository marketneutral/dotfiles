#!/bin/bash

git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

mkdir ~/.emacs.d
mkdir ~/.emacs.d/themes
curl -L https://raw.githubusercontent.com/sjahl/emacs-theme-afterglow/master/afterglow-theme.el > ~/.emacs.d/themes/afterglow-theme.el

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
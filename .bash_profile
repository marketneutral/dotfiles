export "THEANO_FLAGS='gcc.cxxflags=-Wno-c++11-narrowing'"
export TERM=xterm-256color

alias ls='ls -ahF --color'

export GIT_PROMPT_ONLY_IN_REPO=0
# cd ~
# git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1
source ~/.bash-git-prompt/gitprompt.sh

export ZIPLINE_ROOT=/home/jovyan/shared/.zipline
export PYTHON_VERSION=3.5

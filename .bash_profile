export "THEANO_FLAGS='gcc.cxxflags=-Wno-c++11-narrowing'"
export TERM=xterm-256color
export EDITOR=emacs

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
   platform='macos'
fi

if [[ $platform == 'unknown' ]]; then
   alias ls='ls -hF --color'
elif [[ $platform == 'macos' ]]; then
   alias ls='ls -hFG'
fi

export GIT_PROMPT_ONLY_IN_REPO=0
# cd ~
# git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1
source ~/.bash-git-prompt/gitprompt.sh

export ZIPLINE_ROOT=/home/jovyan/shared/.zipline


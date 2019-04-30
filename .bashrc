export ZIPLINE_ROOT=/home/jovyan/shared/.zipline
export PYTHON_VERSION=3.5

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/conda/etc/profile.d/conda.sh" ]; then
        . "/opt/conda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export "THEANO_FLAGS='gcc.cxxflags=-Wno-c++11-narrowing'"
export TERM=xterm-256color

alias ls='ls -ahF --color'

export GIT_PROMPT_ONLY_IN_REPO=0

# cd ~
# git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1
source ~/.bash-git-prompt/gitprompt.sh

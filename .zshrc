# .zshrc

export LC_ALL=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Source global definitions
if [ -f /etc/zshrc ]; then
	. /etc/zshrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# source the configuation files
typeset -U config_files
config_files=($HOME/.config/zsh/**.zsh)
# load the path files
for file in ${(M)config_files}
do
  source $file
done
unset config_files


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/pscratch/sd/b/beckermr/dmstack-coadding/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/pscratch/sd/b/beckermr/dmstack-coadding/etc/profile.d/conda.sh" ]; then
        . "/pscratch/sd/b/beckermr/dmstack-coadding/etc/profile.d/conda.sh"
    else
        export PATH="/pscratch/sd/b/beckermr/dmstack-coadding/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
export LMOD_SYSTEM_DEFAULT_MODULES="python:cray-libsci:craype-network-arises:cray-mpich:craype"


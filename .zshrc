## .zshrc

# the great intel fortran compiler
#source /opt/intel/bin/ifortvars.sh intel64

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
SABLE_AUTO_TITLE=true
plugins=()

# source the configuation files
typeset -U config_files
config_files=($HOME/.config/zsh/**.zsh)
# load the path files
for file in ${(M)config_files}
do
  source $file
done
unset config_files

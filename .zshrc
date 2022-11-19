## .zshrc

# the great intel fortran compiler
#source /opt/intel/bin/ifortvars.sh intel64

# source the configuation files
typeset -U config_files
config_files=($HOME/.config/zsh/**.zsh)
# load the path files
for file in ${(M)config_files}
do
  source $file
done
unset config_files

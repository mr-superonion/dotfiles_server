## alias
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

alias l='ls -CF'
alias la='ls -A'
alias ll='ls -lF'
alias ls='ls --color=auto'

alias qstatxc="squeue -o'%.7i %.9P %.8j %.8u %.2t %.10M %.6D %C'| grep $USER"
alias qstat="squeue -o'%.7i %.9P %.8j %.8u %.2t %.10M %.6D %C'"
alias vim='nvim'
alias config='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias qdel='scancel'

## autocomplete
# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending
autoload -Uz compinit
compinit
compdef vim='nvim'
compdef config='git'
setopt complete_aliases

## vim-like
bindkey -v
export KEYTIMEOUT=1

# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-search
bindkey "^[OB" down-line-or-search
bindkey -M vicmd "k" up-line-or-search
bindkey -M vicmd "j" down-line-or-search
bindkey "^?" backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init

# Use beam shape cursor on startup.
echo -ne '\e[5 q'
# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[5 q' ;}

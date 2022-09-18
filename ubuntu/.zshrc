source ~/.my_configs/common/.zsh_aliases

# Setting up the prompt
PROMPT="%F{032}%n%f@%F{032}ubuntu%f:%F{034}%~%f> "
RPROMPT="%W-%*"

# Settign up history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Case sensitive completition
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Vim stile keybidns
bindkey -e
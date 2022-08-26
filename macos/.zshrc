## This is if I dont have my p10k config setup
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.zsh_history
HISTSIZE=500
SAVEHIST=500
bindkey -e

## This is for oh-my-zsh
export ZSH="/Users/gustavo/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
## Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


## This is for nvm (node version manager)
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# Then we load alias
source ~/.my_configs/macos/.zsh_aliases

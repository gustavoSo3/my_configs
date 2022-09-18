source ~/.my_configs/common/.zsh_aliases

# Setting up the prompt
PROMPT="%F{032}%n%f@%F{032}mbp%f:%F{034}%~%f> "
RPROMPT=""

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

if [ -d ~/gitstatus ];then
	source ~/gitstatus/gitstatus.plugin.zsh

	function my_set_prompt() {
		RPROMPT=""

		if gitstatus_query MY && [[ $VCS_STATUS_RESULT == ok-sync ]]; then
			RPROMPT="%F{034}${${VCS_STATUS_LOCAL_BRANCH:-@${VCS_STATUS_COMMIT}}//\%/%%}%f "  # escape %
			(( VCS_STATUS_NUM_STAGED    )) && RPROMPT+="%F{034}$VCS_STATUS_NUM_STAGED+ %f"
			(( VCS_STATUS_NUM_UNSTAGED  )) && RPROMPT+="%F{160}$VCS_STATUS_NUM_UNSTAGED! %f"
			(( VCS_STATUS_NUM_UNTRACKED )) && RPROMPT+="%F{178}$VCS_STATUS_NUM_UNTRACKED? %f"
		fi

		setopt no_prompt_{bang,subst} prompt_percent  # enable/disable correct prompt expansions
	}

	gitstatus_stop 'MY' && gitstatus_start -s -1 -u -1 -c -1 -d -1 'MY'
	autoload -Uz add-zsh-hook
	add-zsh-hook precmd my_set_prompt
else
	echo gitstatus is not installed check https://github.com/romkatv/gitstatus
fi
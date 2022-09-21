source ~/.my_configs/common/.zsh_aliases

# Setting up the prompt
PROMPT="%F{032}%n%f@%F{032}mbp%f:%F{034}%(5~|%-1~/…/%3~|%4~)%f> "
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
			(( VCS_STATUS_COMMITS_AHEAD )) && RPROMPT+="$VCS_STATUS_COMMITS_AHEAD↗ "
			(( VCS_STATUS_COMMITS_BEHIND )) && RPROMPT+="$VCS_STATUS_COMMITS_BEHIND↙ "
		fi

		setopt no_prompt_{bang,subst} prompt_percent  # enable/disable correct prompt expansions
	}

	gitstatus_stop 'MY' && gitstatus_start -s -1 -u -1 -c -1 -d -1 'MY'
	autoload -Uz add-zsh-hook
	add-zsh-hook precmd my_set_prompt
else
	echo gitstatus is not installed check https://github.com/romkatv/gitstatus
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/gustavosotres/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/gustavosotres/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/gustavosotres/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/gustavosotres/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


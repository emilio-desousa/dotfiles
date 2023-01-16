##/home/sica Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ ! -z $TMUX && -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
ZSH_THEME="powerlevel10k/powerlevel10k"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

plugins=( 
	git
	# sudo 
	zsh-autosuggestions 
	zsh-syntax-highlighting
	zsh-z
	fzf-zsh-plugin
	zsh-vi-mode
)


# # pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

# # eval "$(direnv hook zsh)"

[[ -f ~/.zsh_conf/.aliases ]] && \. ~/.zsh_conf/.aliases
[[ -f ~/.zsh_conf/.path ]] && \. ~/.zsh_conf/.path
[[ -f ~/.zsh_conf/.env ]] && \. ~/.zsh_conf/.env
source /Users/emiliodesousa/.fzf/shell/completion.zsh
source /Users/emiliodesousa/.fzf/shell/key-bindings.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

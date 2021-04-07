# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ ! -z $TMUX && -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
#alias tmux="TERM=screen-256color tmux -2"
#if [ "$TMUX" = "" ]; then tmux; fi
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
[[ -f ~/.zsh_conf/.aliases ]] && \. ~/.zsh_conf/.aliases
[[ -f ~/.zsh_conf/.env ]] && \. ~/.zsh_conf/.env
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="minimal"
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=false
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

plugins=(  vi-mode git virtualenv )

source $ZSH/oh-my-zsh.sh
# Export colors for tmux
export TERM=xterm-256color
export VISUAL=nvim
export EDITOR=$VISUAL
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/emiliodesousa/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/emiliodesousa/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/emiliodesousa/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/emiliodesousa/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
# Load fzf
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/emiliodesousa/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/emiliodesousa/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/emiliodesousa/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/emiliodesousa/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
LC_CTYPE=fr_FR.UTF-8
LC_ALL=fr_FR.UTF-8

##/home/sica Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ ! -z $TMUX && -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export PATH=$PATH:$HOME/bin
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=( git sudo zsh-z zsh-vi-mode zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

[[ -f ~/.zsh_conf/.aliases ]] && \. ~/.zsh_conf/.aliases
[[ -f ~/.zsh_conf/.env ]] && \. ~/.zsh_conf/.env

export TERM=xterm-256color
export VISUAL=nvim
export EDITOR=$VISUAL

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
LC_CTYPE=fr_FR.UTF-8
LC_ALL=fr_FR.UTF-8
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zvm_after_init() {
  source $HOME/.zsh_conf/.fzf
}
zvm_after_init_commands+=('[ -f ~/.fzf ] && source ~/.fzf')
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
eval "$(direnv hook zsh)"
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/emiliodesousa/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/emiliodesousa/Downloads/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/emiliodesousa/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/emiliodesousa/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
eval "$(pyenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export COURSIER=$HOME/.local/share/coursier/bin

export PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:$COURSIER:$PATH

export ZSH="/home/marko/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# eval `dircolors ~/.dir_colors/dircolors`

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

#export JAVA_HOME=/usr/bin/java
export PYTHON=/usr/bin/python

export GOOGLE_APPLICATION_CREDENTIALS="/home/marko/secrets/gcloud-storage-blindsend.json"

alias config='/usr/bin/git --git-dir=/home/marko/.cfg/ --work-tree=/home/marko'
alias v='nvim'
alias grep='rg'

[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/init-nvm.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

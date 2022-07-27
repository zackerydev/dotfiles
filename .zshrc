# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="simple"

plugins=(git asdf aws)

source $ZSH/oh-my-zsh.sh

# User configuration
export GPG_TTY=$(tty)

alias helm2="/opt/homebrew/opt/helm@2/bin/helm"

# Detect Dark Mode
if [[ -z "${CODESPACES}" ]]; then
  if defaults read -g AppleInterfaceStyle &>/dev/null; then
    kitty +kitten themes --reload-in=all Github-default-dark
    export THEME="DARK"
  else
    kitty +kitten themes --reload-in=all Github-light-default
    export THEME="LIGHT"
  fi
else 
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  export TERM="xterm-256color"
fi

# Completion for GH
autoload -U compinit
compinit -i

# Config

export XDG_CONFIG_HOME=~/.config
export AWS_PROFILE=default
export NODE_ENV=development

alias sz="source ~/.zshrc"
alias gs="git status"
alias k="kubectl"
alias gpf="git commit -a --amend && git push -f"
alias dev="~/Development"
alias notes="~/Documents/notes"
alias cop="copilot"
alias wt="git worktree"

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export PATH="/Users/zack.griesinger/Library/Caches/fnm_multishells/68419_1658349880653/bin":$PATH
export FNM_MULTISHELL_PATH="/Users/zack.griesinger/Library/Caches/fnm_multishells/68419_1658349880653"
export FNM_VERSION_FILE_STRATEGY="local"
export FNM_DIR="/Users/zack.griesinger/Library/Application Support/fnm"
export FNM_LOGLEVEL="info"
export FNM_NODE_DIST_MIRROR="https://nodejs.org/dist"
export FNM_ARCH="arm64"
rehash

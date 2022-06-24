# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/zack.griesinger/.oh-my-zsh"

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


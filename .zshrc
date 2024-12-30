# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="simple"

plugins=(git aws)

source $ZSH/oh-my-zsh.sh

# User configuration
export GPG_TTY=$(tty)

alias helm2="/opt/homebrew/opt/helm@2/bin/helm"
alias tf="terraform"

export ASDF_GOLANG_MOD_VERSION_ENABLED=true

# if OSTYPE is Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  export THEME="DARK"
  # export TERM="tmux-256color"
else 
    # kitty +kitten themes --reload-in=all Github-light-default
    mv ~/.config/k9s/skin-light.yml ~/.config/k9s/skin.yml 2>/dev/null; true
    export THEME="LIGHT"
    export CATPUCCIN_THEME="latte"
    export TMUX_BG="#ffffff"
fi

# Completion for GH
autoload -U compinit
compinit -i

# Config

export XDG_CONFIG_HOME=~/.config
export NODE_ENV=development
export APOLLO_TELEMETRY_DISABLED=1
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

alias sz="source ~/.zshrc"
alias mark-local="~/GitHub/zgriesinger/mark/mark"
alias a="assume"
alias gs="git status"
alias k="kubectl"
alias ctx="kubectx"
alias c="cargo"
alias p="pnpm"
alias n="npm"
alias gpf="git commit -a --amend && git push -f"
alias dev="~/GitHub"
alias z="~/GitHub/zackerydev"
alias notes="~/Documents/notes"
alias cop="copilot"
alias wt="git worktree"
alias web="gh pr view --web"
alias rt="cd ../../../"
alias aed="aws-vault exec default"

# bazel aliases
alias b="bazel"
alias bb="bazel build"
alias br="bazel run"
alias bt="bazel test"
alias bq="bazel query"

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# pnpm
export PNPM_HOME="/Users/zack.griesinger/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH="$HOME/.moon/bin:$PATH"
# pnpm end

# export PATH=$PATH:$(go env GOPATH)/bin

export AWS_SESSION_TOKEN_TTL=4h
export AWS_CHAINED_SESSION_TOKEN_TTL=4h
export AWS_ASSUME_ROLE_TTL=4h
export AWS_FEDERATION_TOKEN_TT=4h


export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export EDITOR=nvim

# bun completions
[ -s "/Users/zack.griesinger/.bun/_bun" ] && source "/Users/zack.griesinger/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# nix
any-nix-shell zsh --info-right | source /dev/stdin

hrbytes() {  # human readable bytes. numfmt is cool.
  local num;
  if [[ $# -lt 1 ]]; then
    read num;
  else
    num="$1"
  fi
  local from
  if [[ "$num" =~ [KMGTPEZY]i$ ]]; then
    from="--from=iec-i"
  elif [[ "$num" =~ [KMGTPEZY]$ ]]; then
    from="--from=si"
  fi
  # purposefully not quoting from to avoid empty string issues
  numfmt --to=iec-i --suffix=B --format="%.3f" $from "${num//,}"
}



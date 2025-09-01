# oh my zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="simple"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Aliases
alias sz="source ~/.zshrc"
alias gs="git status"
alias k="kubectl"
alias ctx="kubectx"
alias c="cargo"
alias p="pnpm"
alias n="npm"
alias z="zoxide"
alias rt="cd ../../../"
alias tf="terraform"
# Git
alias gwt="git worktree"
alias gpf="git commit -a --amend && git push -f"
alias web="gh pr view --web"
# folders
alias dev="~/GitHub"
alias notes="~/Documents/main"
# bazel 
alias b="bazel"
alias bb="bazel build"
alias br="bazel run"
alias bt="bazel test"
alias bq="bazel query"
# dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# rust
. "$HOME/.cargo/env"
export EDITOR=nvim
# local binaries
export PATH="/Users/zackery/.local/bin:$PATH"
# claude
alias claude="/Users/zackery/.claude/local/claude"
# opencode
export PATH=/Users/zackery/.opencode/bin:$PATH
# bob
export PATH=/Users/zackery/.local/share/bob/nvim-bin:$PATH
# mise vm
eval "$(/Users/zackery/.local/bin/mise activate zsh)"
# Go
export PATH=$PATH:$(go env GOPATH)/bin

# pnpm
export PNPM_HOME="/Users/zackery/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

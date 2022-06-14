# Zack's Dotfiles

## Getting Started
This getting started setup was found on HackerNews a few years ago and is my preferred way to setup dotfiles. I like not having to maintain a setup script.
```bash
gh repo clone zgriesinger/dotfiles ~/.dotfiles -- --bare
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

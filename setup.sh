# The first thing we need is Brew!

echo "Setting up Dotfiles"
dir=$(pwd)

NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# When on Linux install some stuff that's typically cask'ed
# curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# OMZ Reinstall we don't care
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" "--unattended"

# Oh My ZSH plugins
git clone https://github.com/asdf-vm/asdf.git ~/.asdf 2> /dev/null 

# Packer for Neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim 2> /dev/null


if [ -z "${CODESPACES}" ]; then
  echo "Detected non CodeSpaces env, skipping..."
else
  echo "Detected CodeSpaces, running symlinks"
  ln -sf $dir/.config $HOME/.config
  ln -sf $dir/.tmux.conf $HOME/.tmux.conf
  ln -sf $dir/.zshrc $HOME/.zshrc
  ln -sf $dir/.asdfrc $HOME/.asdfrc
  ln -sf $dir/.tmux $HOME/.tmux
  ln -sf $dir/.bash_profile $HOME/.bash_profile

  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.zshrc
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  echo "Symlinks complete, running default setup!"

  git config --global user.email "zgriesinger@gmail.com"
  git config --global user.name "Zackery Griesinger"
fi

# Load the Brewfile
brew bundle --file $dir/.brew/Brewfile

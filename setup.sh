# The first thing we need is Brew!

echo "Setting up Dotfiles"
dir=$(pwd)

# When on Linux install some stuff that's typically cask'ed
# curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

if [ -z "${CODESPACES}" ]; then
  echo "Detected non CodeSpaces env, loading Brewfile"
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Load the Brewfile
  brew bundle --file $dir/.brew/Brewfile
else
  echo "Detected CodeSpaces/Linux, running symlinks"
  ln -sf $dir/.config $HOME/.config
  ln -sf $dir/.tmux.conf $HOME/.tmux.conf
  ln -sf $dir/.zshrc $HOME/.zshrc
  ln -sf $dir/.asdfrc $HOME/.asdfrc
  ln -sf $dir/.tmux $HOME/.tmux
  ln -sf $dir/.bash_profile $HOME/.bash_profile

  echo "Symlinks complete, running default setup!"


  # Setup Repositories for Neovim and Kubectl
  sudo mkdir /etc/apt/keyrings
  sudo add-apt-repository -y ppa:neovim-ppa/unstable
  sudo apt update
  sudo apt install -y ca-certificates curl
  sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
  echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
  sudo apt update

  sudo apt install -y \
    git \
    neovim \
    zsh \
    tmux \
    kubectl \
    ripgrep \
    fd-find


  git config --global user.email "zgriesinger@gmail.com"
  git config --global user.name "Zackery Griesinger"
fi


# OMZ Reinstall we don't care
rm -rf ~/.oh-my-zsh
KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" "--unattended"

# AstroNvim
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim

# Oh My ZSH plugins
git clone https://github.com/asdf-vm/asdf.git ~/.asdf 2> /dev/null 

#!/usr/bin/fish

function setup
  mv ~/.config/fish ~/.config/old-fish
  mv ~/.gitconfig ~/.old-gitconfig
  ln -s ~/dotfiles/.config/fish ~/.config/fish
  ln -s ~/dotfiles/.gitconfig ~/.gitconfig
  ln -s ~/dotfiles/.themes ~/.themes
end

function install-linux-packages
  echo "Installing Linux stuff…"
  set -x DEBIAN_FRONTEND noninteractive
  echo "deb http://deb.debian.org/debian buster-backports main" >> /etc/apt/sources.list
  echo "deb http://ftp.be.debian.org/debian unstable main contrib non-free" >> /etc/apt/sources.list
  sudo apt-get update \
    && apt-get -y install --no-install-recommends -t stable silversearcher-ag \
    && apt-get -y install --no-install-recommends -t buster-backports git jq fzf fish neovim \
    && apt-get -y install --no-install-recommends -t unstable exa
  # sudo apt-get -y install build-essential
end

function install-homebrew
  echo "Installing Homebrew…"
  wget -qO- https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash; exit
  /home/linuxbrew/.linuxbrew/bin/brew shellenv >> ~/.config/fish/config.fish
  eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

  brew install exa
end

function download-jetbrains-mono
  set theFont JetBrainsMono-2.225.zip
  wget https://download.jetbrains.com/fonts/(theFont)
  sudo unzip (theFont) -d /usr/share/fonts
  sudo fc-cache -f -v
end  

setup
install-linux-packages
# install-homebrew
download-jetbrains-mono

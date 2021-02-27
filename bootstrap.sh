#!/usr/bin/fish

function install-linux-packages
  echo "Installing Linux stuff…"
  set -x DEBIAN_FRONTEND noninteractive
  sudo apt-get update
  sudo apt-get -y install build-essential
end

function install-homebrew
  echo "Installing Homebrew…"
  wget -qO- https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash
  /home/linuxbrew/.linuxbrew/bin/brew shellenv >> $HOME/.config/fish/config.fish
  eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

  brew install exa
end

install-linux-packages
install-homebrew

# Install Jetbrains Mono font
# wget https://download.jetbrains.com/fonts/JetBrainsMono-2.001.zip
# sudo unzip JetBrainsMono-2.001.zip -d /usr/share/fonts
# sudo fc-cache -f -v
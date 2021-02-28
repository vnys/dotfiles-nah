#!/usr/bin/fish

function setup
  # mv ~/.config/fish ~/.config/old-fish
  mv ~/.gitconfig ~/.old-gitconfig
  ln -s ~/dotfiles/.config/fish ~/.config/fish
  ln -s ~/dotfiles/.gitconfig ~/.gitconfig
  ln -s ~/dotfiles/.themes ~/.themes
end

function install-linux-packages
  echo "Installing Linux stuff…"
  set -x DEBIAN_FRONTEND noninteractive
  sudo apt-get -y install build-essential
end

function install-homebrew
  echo "Installing Homebrew…"
  sudo git clone https://github.com/Homebrew/brew /home/linuxbrew/.linuxbrew
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
install-homebrew
# download-jetbrains-mono

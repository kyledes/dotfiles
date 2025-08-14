#!/bin/bash

function installSoftware() {
    sudo apt update
    sudo apt install curl -v
    sudo apt install git -y
    sudo apt install neovim -y
    sudo apt install tmux -y
    sudo apt install kitty -y
    sudo apt install shpotify -y
    sudo apt install ripgrep -y
    # needed for pyright install
    sudo apt install npm -y
}

function installNeovim() {
    echo "==================================="
    echo "Installing Neovim"
    echo "==================================="

    if [ "$#" -eq 0 ]; then
        version="v0.11.3"
    else
        version=$1
    fi
    neo_url="https://github.com/neovim/neovim/releases/download/${version}/nvim-linux-x86_64.tar.gz"
    mkdir ~/nvim
    cd ~/nvim
    wget ${neo_url}
    tar xvzf nvim-linux86_64.tar.gz -C ~/.local/share/
    mkdir ~/.local/bin
    cd ~/.local/bin/
    ln -sf ~/.local/share/nvim-linux64/bin/nvim nvim
    #nvim -v | head -n 1 | awk '{print $2}'

}

function installBrave() {

    echo "==================================="
    echo "Install brave"
    echo "==================================="
    sudo apt install curl
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    sudo curl -fsSLo /etc/apt/sources.list.d/brave-browser-release.sources https://brave-browser-apt-release.s3.brave.com/brave-browser.sources
    sudo apt update
    sudo apt install brave-browser
}

function installgo() {
    echo "==================================="
    echo "Installing go"
    echo "==================================="

    # install go
    #  gofmt
    #  goimports_reviser
}

function cloneDotfiles() {

    echo "==================================="
    echo "Cloning dotfiles"
    echo "==================================="

    cd ~/

    git clone https://github.com/kyledes/dotfiles.git

}

function setupNvim() {
    echo "==================================="
    echo "Setting up neovim"
    echo "==================================="

    cd ~/

    ln -sf ~/dotfiles/nvim ~/.config/nvim

}

function setupTmux() {

    echo "==================================="
    echo "Linking tmux config"
    echo "==================================="

    cd ~/

    ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

}

function installFonts() {

    echo "==================================="
    echo "copying font"
    echo "==================================="

    cd ./mononoki_nf
    sh -c "./install_font.sh"
}

function configureTerminal() {
    echo "==================================="
    echo "linking terminal config"
    echo "==================================="

    cd ~/
    mkdir -p ~/.conf/kitty
    ln -sf ~/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
}

function configurei3() {
    echo "==================================="
    echo "linking i3 config"
    echo "==================================="

    cd ~/
    mkdir -p ~/.config/i3
    ln -sf ~/dotfiles/i3/config ~/.config/i3/config
}

installNeovim

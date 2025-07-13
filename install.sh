#!/bin/bash

function installSoftware(){
    sudo apt update
    sudo apt install curl -v
    sudo apt install git -y
    sudo apt install neovim -y
    sudo apt install tmux -y
    sudo apt install kitty -y
    sudo apt install shpotify -y
    sudo apt install ripgrep -y
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

    ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

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
    ln -sf ~/dotfiles/kitty/kitty.conf ~/.conf/kitty/kitty.conf
}

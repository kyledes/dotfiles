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

function cloneDotfiles() {

    echo "==================================="
    echo "Cloning dotfiles"
    echo "==================================="

    cd ~/

    git clone https://github.com//dotfiles.git

    # Create secret keys file - used to store local env vars
    touch ~/dotfile/secret-keys.sh

    # Create secret functions file - used to store device specific functions
    touch ~/dotfile/secret-functions.sh

    # Create aliases script file to store zsh aliases
    touch ~/dotfiles/aliases.sh

    # Clone gruvbox community fork and symlink it
    git clone https://github.com/gruvbox-community/gruvbox.git ~/personal/gruvbox-community
    ln -sf ~/personal/gruvbox-community/colors/gruvbox.vim ~/dotfiles/vim_colors/gruvbox.vim

    # Clone zsh syntax highlighting dir
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

}

function setupNvim() {
    echo "==================================="
    echo "Setting up neovim"
    echo "==================================="    

    cd ~/
    mkdir -p ~/.config/nvim

}

function setupTmux() {

    echo "==================================="
    echo "Linking tmux config"
    echo "==================================="

    cd ~/

    touch ~/.tmux.conf
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
    ln -sf ~/dotfiles/kitty/kitty.conf ~/.conf/kitty/kitty.conf
}

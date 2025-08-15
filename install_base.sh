#!/bin/bash

function ubuntuPackages() {
    software=("curl" "git" "tmux" "kitty" "shpotify" "ripgrep" "stow" "npm")
}

function coderPackages() {
    software=("stow" "tmux" "ripgrep" "gcc")
}

function installSoftware() {
    sudo apt update -y
    sudo apt install "${software[@]}" -y
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
    mkdir -p ~/nvim
    cd ~/nvim
    wget ${neo_url}
    tar xvzf nvim-linux-x86_64.tar.gz -C ~/.local/share/
    # pv -s $(stat -c %s nvim-linux-x86_64.tar.gz) ./nvim-linux-x86_64.tar.gz | tar xz
    mkdir -p ~/.local/bin
    cd ~/.local/bin/
    ln -sf ~/.local/share/nvim-linux-x86_64/bin/nvim nvim
    if ! grep -qF "# add .local/bin" ~/.bashrc; then
        echo "# add .local/bin" >>~/.bashrc
        echo 'export PATH=$PATH:~/.local/bin' >>~/.bashrc
        source ~/.bashrc
        installed="$(nvim -v | head -n 1 | awk '{print $2}')"
        if [[ "$installed" == "$version" ]]; then
            echo "nvim installed"
        fi
    fi
    cd ~
    rm -rf ~/nvim
}
function coderStow() {
    stowTargets=("nvim" "tmux")
}

function linkConfig() {

    if [ "$#" -eq 0 ]; then
        config="$HOME/dotfiles"
    else
        config=$1
    fi

    cd "${config}"
    for package in "${stowTargets[@]}"; do
        mkdir -p "$HOME/.config/${package}"
        stow "${package}" -t "$HOME/.config/${package}"
    done
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
coderPackages
installSoftware
coderStow
linkConfig

#!/bin/bash

echo "performing general update"
sudo apt update
sudo apt upgrade

echo "installing git"
sudo apt install git

echo "installing gnome-tweaks"
sudo apt install gnome-tweaks;

echo -n "do you want to install google chrome [y/n]: "
read ch
case $ch in
    "y" | "Y")
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        sudo apt install ./google-chrome-stable_current_amd64.deb
        ;;
    *)
        echo "not installing google chrome";;
esac
echo -n "do you want to install vim [y/n]: "
read ch
case $ch in
    "y" | "Y")
        sudo apt install vim-gtk3
        wget https://github.com/kartheek542/scripts/blob/master/vim_config.txt 
        mv vim_config.txt ~/.vimrc
        ;;
    *)
        echo "not installing vim";;
esac
echo -n "do you want to install neovim [y/n]: "
read ch
case $ch in
    "y" | "Y")
        sudo apt install neovim
        wget https://github.com/kartheek542/scripts/blob/master/init.vim
        mv init.vim ~/.config/nvim/init.vim
        ;;
    *)
        echo "not installing neovim";;
esac
echo -n "do you want to install obs [y/n]: "
read ch
case $ch in
    "y" | "Y")
        sudo apt install obs-studio
        ;;
    *)
        echo "not installing obs";;
esac
echo -n "do you want to install vscode [y/n]: "
read ch
case $ch in
    "y" | "Y")
        sudo apt install software-properties-common apt-transport-https wget
        wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
        sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
        sudo apt install code
        ;;
    *)
        echo "not installing vscode";;
esac
echo -n "do you want to install sublime-text [y/n]: "
read ch
case $ch in
    "y" | "Y")
        sudo apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common
        curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
        sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
        sudo apt install sublime-text
        ;;
    *)
        echo "not installing sublime-text";;
esac
echo "installing basic tools"
sudo apt install figlet

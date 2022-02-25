#!/bin/bash


# this script assumes that git is already installed and
# the script is also used by cloning the repository from github. repo link ( https://github.com/kartheek542/scripts )

cd ~

# general upgrade
echo "performing general update"
sleep 1
sudo apt update
echo "yes" | sudo apt upgrade




# installing gnome-tweaks
echo "installing gnome-tweaks"
sleep 1
sudo apt install -y gnome-tweaks;




# google chrome
echo -n "do you want to install google chrome [y/n]: "
read ch
case $ch in
    "y" | "Y")
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        sudo apt install -y ./google-chrome-stable_current_amd64.deb
        if [ $? -eq 0 ]
        then
            rm ./google-chrome-stable_current_amd64.deb
            echo "google chrome installed successfully"
        fi
        ;;
    *)
        echo "not installing google chrome";;
esac






# vim
echo -n "do you want to install vim [y/n]: "
read ch
case $ch in
    "y" | "Y")
        sudo apt install -y vim-gtk3
        echo "vim installed successfully"
sleep 1
        echo "installing vim-plug"
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        echo "vim plug installation completed"
        ln ~/scripts/vim_config.txt ~/.vimrc
        echo "vimrc setup completed"
        echo "you need to open your vimrc and hit :PlugInstall to install all the plugins"
sleep 1
        ;;
    *)
        echo "not installing vim";;
esac







# neovim
echo -n "do you want to install neovim [y/n]: "
read ch
case $ch in
    "y" | "Y")
        sudo apt install -y neovim
        echo "nvim installation completed"
        echo "installing vim-plug for neovim"
sleep 1
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        test -d ~/.config/nvim || mkdir ~/.config/nvim
        cp ~/scripts/init.vim ~/.config/nvim/init.vim
        echo "neovim configuration setup completed"
sleep 1
        ;;
    *)
        echo "not installing neovim";;
esac







# obs-studio
echo -n "do you want to install obs [y/n]: "
read ch
case $ch in
    "y" | "Y")
        sudo apt install -y obs-studio
        echo "obs is successfully installed"
sleep 1
        ;;
    *)
        echo "not installing obs";;
esac







# vs code
echo -n "do you want to install vscode [y/n]: "
read ch
case $ch in
    "y" | "Y")
        sudo apt install -y software-properties-common apt-transport-https wget
        wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
        sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
        sudo apt install -y code
        echo "vs-code installed successfully"
sleep 1
        ;;
    *)
        echo "not installing vscode";;
esac








# sublime-text
echo -n "do you want to install sublime-text [y/n]: "
read ch
case $ch in
    "y" | "Y")
        sudo apt install -y dirmngr gnupg apt-transport-https ca-certificates software-properties-common
        curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
        sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
        sudo apt install -y sublime-text
        echo "sublime-text installed successfully"
sleep 1
        ;;
    *)
        echo "not installing sublime-text";;
esac





# installing basic tools
echo "installing basic tools"
sudo apt install figlet

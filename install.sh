#!/bin/sh

DISTRO=$(cat /etc/os-release | sed -nr "s/^ID=(.*)$/\1/p")

case $DISTRO in 
    debian|ubuntu)
        sh deps.debian.sh
        break;;
    arch|manjaro)
        sh deps.arch.sh
        break;;
esac

sudo pip3 install deluge pywal colorz neovim

# Install the dotfiles
cp -arv home/. ~/

# Install vimplug in neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim -c ':PlugInstall
:UpdateRemotePlugins
:q!
:q!'




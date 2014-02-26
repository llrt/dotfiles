#!/bin/bash
#
# Homebrew-cask
#
# This installs some of the common needed (or at least desired) applications
# using Homebrew-cask

echo "Setting up Homebrew-cask applications..."

function install_as_needed(){
    local PACKAGE=$1
    local OPT=$2

    if test ! $(brew cask list | grep $PACKAGE); then
        echo "$PACKAGE not found. installing."
        brew cask install $PACKAGE $OPT
    else
        echo " $PACKAGE already installed."
    fi
}

brew tap phinze/cask
brew install brew-cask


# Check for virtualbox and install it if needed
install_as_needed 'virtualbox'

# Check for vagrant and install it if needed
install_as_needed 'vagrant'

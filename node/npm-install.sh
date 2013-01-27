#!/bin/zsh
#
# This installs some of the common npm packages needed (or at least desired).

echo " Setting up npm packages... "

function install_as_needed(){
    local PACKAGE=$1
    local OPT=$2
    if test ! $(npm list | grep $PACKAGE); then
        echo "$PACKAGE not found. installing."
        npm install $PACKAGE $OPT
    else
        echo " $PACKAGE already installed."
    fi
}


# Check for backbone package and install it if needed
install_as_needed 'backbone'

# Check for mongoose package and install it if needed
install_as_needed 'mongoose'

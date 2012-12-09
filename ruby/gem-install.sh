#!/bin/bash
#
# This installs some of the common ruby gems needed (or at least desired).

echo " Setting up ruby gems... "

function admin_perm(){
    # Ask for the administrator password
    echo "Admin permissions are required."
    sudo -v 
}

function install_as_needed(){
    local GEM=$1
    if test ! $(gem which $GEM); then
        echo "$GEM not found. installing."
        admin_perm && sudo gem install $GEM
    else
        echo " $GEM already installed."
    fi
}


# Check for rmagick gem and install it if needed
install_as_needed 'rmagick'

# Check for gnuplot gem and install it if needed
install_as_needed 'gnuplot'

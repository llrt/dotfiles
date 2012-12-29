#!/bin/zsh
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
    local OPT=$2
    if test ! $(gem which $GEM); then
        echo "$GEM not found. installing."
        gem install $GEM $OPT
    else
        echo " $GEM already installed."
    fi
}


# Check for rmagick gem and install it if needed
install_as_needed 'active_support'

# Check for rmagick gem and install it if needed
install_as_needed 'rmagick'

# Check for gnuplot gem and install it if needed
install_as_needed 'gnuplot'

# Check for rsruby gem and install it if needed
install_as_needed 'rsruby' "-- --with-R-dir=$R_HOME"

# Check for bson_ext gem and install it if needed
install_as_needed 'bson_ext'

# Check for mongodb gem and install it if needed
install_as_needed 'mongodb'

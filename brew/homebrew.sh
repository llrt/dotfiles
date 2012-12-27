#!/bin/bash
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

echo "Setting up Homebrew packages..."

function install_as_needed(){
    local PACKAGE=$1
    local OPT=$2

    if test ! $(brew list | grep $PACKAGE); then
        echo "$PACKAGE not found. installing."
        brew install $PACKAGE $OPT
    else
        echo " $PACKAGE already installed."
    fi
}


# Check for Homebrew
if test ! $(which brew)
then
  echo "  x You should probably install Homebrew first:"
  echo "    https://github.com/mxcl/homebrew/wiki/installation"
  exit
else
  echo "  + Homebrew found."
fi

# Check for grc and install it if needed
install_as_needed 'grc'

# Check for coreutils and install it if needed
install_as_needed 'coreutils' 

# Tap another repository
brew tap homebrew/dupes

# Check for autoconf, automake, apple-gcc42 and install them if needed
install_as_needed 'autoconf'
install_as_needed 'automake'
install_as_needed 'apple-gcc42'

# Check for ack and install it if needed
install_as_needed 'ack'

# Check for unrar and install it if needed
install_as_needed 'unrar'

# Check for mercurial (hg) and install it if needed
install_as_needed 'mercurial'

# Check for todo.txt and install it if needed
install_as_needed 'todo-txt' 

# Check for postgresql and install it if needed
install_as_needed 'postgresql' 

# Check for python and install it if needed
install_as_needed 'python'

# Check for lua and install it if needed
install_as_needed 'lua'

# Check for luajit and install it if needed
install_as_needed 'luajit'

# Check for go and install it if needed
install_as_needed 'go'

# Check for imagemagick and install it if needed
install_as_needed 'imagemagick' '--withx'

# Check for gfortran and install it if needed
install_as_needed 'gfortran'

# Check for R and install it if needed
install_as_needed 'r' '--enable-R-framework'
sudo ln -s "/usr/local/opt/r/R.framework" /Library/Frameworks

# Check for gnuplot and install it if needed
install_as_needed 'gnuplot'

# Check for mongodb and install it if needed
install_as_needed 'mongodb'


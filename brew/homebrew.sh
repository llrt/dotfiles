#!/bin/bash
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

echo "Setting up Homebrew packages..."

function install_as_needed(){
    local CMD=$1
    local PACKAGE=$2
    local OPT=$3

    if test ! $(which $CMD); then
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
install_as_needed 'grc' 'grc'

# Check for coreutils and install it if needed
install_as_needed 'gls' 'coreutils' 

# Check for ack and install it if needed
install_as_needed 'ack' 'ack'

# Check for unrar and install it if needed
install_as_needed 'unrar' 'unrar'

# Check for mercurial (hg) and install it if needed
install_as_needed 'hg' 'hg'

# Check for todo.txt and install it if needed
install_as_needed 'todo.sh' 'todo-txt' 

# Check for postgresql and install it if needed
install_as_needed 'postgres' 'postgresql' 

# Check for lua and install it if needed
install_as_needed 'lua' 'lua'

# Check for luajit and install it if needed
install_as_needed 'luajit' 'luajit'

# Check for go and install it if needed
install_as_needed 'go' 'go'

# Check for rubinius and install it if needed
install_as_needed 'rbx' 'rubinius' 

# Check for imagemagick and install it if needed
install_as_needed 'convert' 'imagemagick' '--withx'

# Check for gfortran and install it if needed
install_as_needed 'gfortran' 'gfortran'

# Check for R and install it if needed
install_as_needed 'r' 'r' '--enable-R-framework'

# Check for gnuplot and install it if needed
install_as_needed 'gnuplot' 'gnuplot'

#!/bin/bash
#
# Homebrew
#
# This installs some of the common needed (or at least desired) dependencies
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
brew untap homebrew/dupes # untap just to be sure to get latest info
brew untap homebrew/science # untap just to be sure to get latest info
brew untap staticfloat/julia # untap just to be sure to get latest info
brew tap homebrew/dupes
brew tap homebrew/science
brew tap staticfloat/julia

# Check for autoconf, automake, apple-gcc42 and install them if needed
install_as_needed 'autoconf'
install_as_needed 'automake'
install_as_needed 'apple-gcc42'

# Check for wget and install it if needed
install_as_needed 'wget'

# Check for ack and install it if needed
install_as_needed 'ack'

# Check for ag and install it if needed
install_as_needed 'the_silver_searcher'

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

# Check for gsl and install it if needed
install_as_needed 'gsl'

# Check for mongodb and install it if needed
install_as_needed 'mongodb'

# Check for nodejs and install it if needed
install_as_needed 'node'

# Check for pcre and install it if needed
install_as_needed 'pcre'

# Check for ocaml and install it if needed
install_as_needed 'ocaml'

# Check for opam and install it if needed
install_as_needed 'opam'

# Check for readline and install it if needed
install_as_needed 'readline'

# Check for antlr and install it if needed
install_as_needed 'antlr'

# Tap another repository
brew tap homebrew/versions

# Check for erlang (R16) and install it if needed
install_as_needed 'erlang-r16'

# Check for elixir and install it if needed
install_as_needed 'elixir'

# Check for couchdb and install it if needed
install_as_needed 'couchdb'

# Check for jython and install it if needed
install_as_needed 'jython'

# Check for maven and install it if needed
install_as_needed 'maven'

# Check for watchman and install it if needed
install_as_needed 'watchman'

# Check for julia and install it if needed
install_as_needed 'julia' '--64bit'

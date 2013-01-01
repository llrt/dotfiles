#!/bin/zsh

# This installs rvm and some versions of ruby

# Install rvm if needed
if test ! $(which rvm); then
    echo " rvm not found. installing."
    \curl -L https://get.rvm.io | bash -s stable --ruby

    # Configure openssl on rvm
    rvm pkg install openssl
else
    echo " rvm already installed."
fi

# Load rvm scripts into current shell environment
if [[ -s $HOME/.rvm/scripts/rvm ]]; then
    source $HOME/.rvm/scripts/rvm;
fi

export CPPFLAGS=-I/opt/X11/include

# Install version 1.8.7 of MRI 
rvm install 1.8.7

# Install version 1.9.2 of MRI 
rvm install 1.9.2

# Use version 1.9.2 of MRI by default
rvm use 1.8.7 --default


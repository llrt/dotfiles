#!/bin/bash

# This installs rvm and some versions of ruby

export CC=`which gcc-4.2`
export CPPFLAGS=-I/opt/X11/include

# Install rvm if needed
if test ! $(which rvm); then
    echo " rvm not found. installing."
    \curl -#L --insecure https://get.rvm.io | bash -s stable

    # Load rvm scripts into current shell environment
    if [[ -s $HOME/.rvm/scripts/rvm ]]; then
        source $HOME/.rvm/scripts/rvm;
    fi

    # Creates ~/.rvm/user directory if needed
    if [ ! -d $HOME/.rvm/user ]; then
        mkdir -p $HOME/.rvm/user
    fi

    # Configure openssl on rvm
    rvm pkg install openssl
else
    echo " rvm already installed."
fi

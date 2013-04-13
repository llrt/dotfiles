#!/bin/bash

export CC=`which gcc-4.2`
export CPPFLAGS=-I/opt/X11/include

# Install version 1.8.7 of MRI 
rvm install 1.8.7 --with-openssl-dir="$rvm_path/usr"

# Install version 1.9.2 of MRI 
rvm install 1.9.2 --with-openssl-dir="$rvm_path/usr" --with-readline-dir="$rvm_path/usr" 

# Use version 1.9.2 of MRI by default
rvm use 1.9.2
rvm use 1.9.2 --default

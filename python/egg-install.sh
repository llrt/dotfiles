#!/bin/bash
#
# This installs some of the common python eggs needed (or at least desired)

echo "Setting up python eggs... "

# Install PIL
pip install PIL

# Install Pygments
pip install Pygments
# Point pygmentize script to the correct python bin (the one from Homebrew)
sudo sed -i -e "s#\/usr#\/usr\/local#g" `which pygmentize`

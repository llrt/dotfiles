#!/bin/bash
#
# This installs some of the common python eggs needed (or at least desired)

echo "Setting up python eggs... "


# Install PIL
easy_install pil

# Install Pygments
easy_install Pygments

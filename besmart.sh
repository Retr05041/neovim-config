#! /bin/bash

# BeSmart - A simple script to help you setup

# Boolean var
dependancyFailure=false

# Check if Neovim is installed
if ! [ -x "$(command -v nvim)" ]; then
  echo 'Error: Neovim is not installed.'
  dependancyFailure=true
  read -p "Automatically install latest version? [y/n]: " response
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
  then
    echo 'Installing Neovim...'
    wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    tar -xzf nvim-linux64.tar.gz
    cp -r nvim-linux64/bin/* /usr/local/bin/
    rm -rf nvim-linux64.tar.gz nvim-linux64
    dependancyFailure=false
    echo "Done!"
  fi
fi

# Check if Node.js is installed
if ! [ -x "$(command -v node)" ]; then
  echo 'Error: Node.js is not installed.'
  dependancyFailure=true
  read -p "Automatically install latest version? [y/n]: " response
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
  then
    echo 'Installing Node.js...'
    wget https://nodejs.org/dist/v20.11.0/node-v20.11.0-linux-x64.tar.xz
    tar -xJf node-v20.11.0-linux-x64.tar.xz
    cp -r node-v20.11.0-linux-x64/bin/node /usr/local/bin/
    rm -rf node-v20.11.0-linux-x64.tar.xz node-v20.11.0-linux-x64
    dependancyFailure=false
    echo "Done!"
  fi
fi

# Check if Python is installed
if ! [ -x "$(command -v python3)" ]; then
  echo 'Error: Python3 is not installed.'
  dependancyFailure=true
fi
# Check if pynvim file exists
if ! [ -f "$HOME/.local/share/nvim/site/pack/packer/start/pynvim/plugin/pynvim.py" ]; then
  echo 'Error: pynvim is not installed.'
  dependancyFailure=true
  read -p "Automatically install latest version? [y/n]: " response
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
  then
    echo 'Installing pynvim...'
    pip3 install pynvim
  fi
fi


# Sanity check dependancies
if [ "$dependancyFailure" = true ]; then
  echo 'Error: Please install the dependancies listed above.'
  exit 1
fi

# Check if Neovim config directory exists and remove it
if [ -d "$HOME/.config/nvim" ]; then
  echo 'Removing existing Neovim config directory...'
  rm -rf $HOME/.config/nvim
fi

# Create Neovim config directory
echo 'Creating Neovim config directory...'
mkdir -p $HOME/.config/nvim
# Copy init.vim, lua/, and UltiSnips/ to Neovim config directory - $HOME/.config/nvim
echo 'Copying init.lua, lua/, and UltiSnips/ to Neovim config directory...'
cp -r init.lua $HOME/.config/nvim
cp -r lua $HOME/.config/nvim
cp -r UltiSnips $HOME/.config/nvim

# Finishing up
echo 'Done!'
echo 'Run :PackerInstall inside Neovim to install plugins'


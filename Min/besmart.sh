#! /bin/bash

# BeSmart - A simple script to help you setup

# Configuring Neovim
########################################

migrate_config () {
  # Check if Neovim config directory exists and remove it
  if [ -d "$HOME/.config/nvim" ]; then
    echo "Removing existing Neovim config directory..."
    rm -rf $HOME/.config/nvim
  fi

  # Check if Neovim "data" directory exists and remove it
  if [ -d "$HOME/.local/share/nvim" ]; then
    echo "Removing existing Neovim \"data\" directory..."
    rm -rf $HOME/.local/share/nvim
  fi

  # Create Neovim config directory
  echo "Creating Neovim config directory..."
  mkdir -p $HOME/.config/nvim
  # Copy init.vim, lua/, and UltiSnips/ to Neovim config directory - $HOME/.config/nvim
  echo "Copying init.lua, and lua/ to Neovim config directory..."
  cp -r init.lua $HOME/.config/nvim
  cp -r lua $HOME/.config/nvim
  cp -r snippets $HOME/.config/nvim
  echo ""
  echo "Migration Successful! - You will need to run nvim twice for the changes to take effect."
}

clean () {
  # Check if Neovim config directory exists and remove it
  if [ -d "$HOME/.config/nvim" ]; then
    echo "Removing existing Neovim config directory..."
    rm -rf $HOME/.config/nvim
  fi

  # Check if Neovim "data" directory exists and remove it
  if [ -d "$HOME/.local/share/nvim" ]; then
    echo "Removing existing Neovim "data" directory..."
    rm -rf $HOME/.local/share/nvim
  fi

  # Check if Neovim repository exists and remove it
  #if [ -f "/etc/apt/sources.list.d/neovim-ppa-ubuntu-unstable-jammy.list" ]; then
  #  echo "Removing existing Neovim repository..."
  #  sudo apt-get purge neovim &&\
  #  add-apt-repository --remove ppa:neovim-ppa/unstable
  #fi
}

user_input () {
  echo ""
  echo "Please select what you would like to do? "
  echo "1. Migrate repo config ~ THIS WILL REPLACE CURRENT CONFIG"
  echo "2. Clean ~ Remove everything added by script"
  echo "9. Exit"

  read -p "Enter your choice: " choice

  case $choice in
    1) 
      migrate_config 
      ;;
    2) 
      clean
      ;;
    9) 
      echo "Exiting..." 
      exit 0
      ;;
    *) 
      echo "Invalid choice" 
      user_input
      ;;
  esac
}
user_input

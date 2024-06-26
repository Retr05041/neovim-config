#! /bin/bash

# BeSmart - A simple script to help you setup

# Dependancies:
########################################

# Boolean var
dependancyFailure=false

# Check if Neovim is installed
if ! [ -x "$(command -v nvim)" ]; then
  echo "Error: Neovim is not installed."
  dependancyFailure=true
  read -p "Automatically install latest version? [y/n]: " response
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
  then
    echo "Adding Neovim repository..."
    sudo add-apt-repository ppa:neovim-ppa/unstable
    echo "Installing Neovim..."
    sudo apt install neovim
    dependancyFailure=false
    echo "Neovim successfully installed!"
  else
    echo "Skipping..."
  fi
fi

# Check if Node.js is installed
if ! [ -x "$(command -v node)" ]; then
  echo "Error: Node.js is not installed."
  dependancyFailure=true
  read -p "Automatically install latest version? [y/n]: " response
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
  then
    echo "Installing Node.js..."
    curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - &&\
    sudo apt-get install -y nodejs
    sudo npm install -g neovim
    dependancyFailure=false
    echo "Nodejs & 'Neovim' dependancy successfully installed!"
  else
    echo "Skipping..."
  fi
fi

# Check if Python is installed
if ! [ -x "$(command -v python3)" ]; then
  echo "Error: Python3 is not installed."
  dependancyFailure=true
fi

# Check if pynvim library is installed
if [ "$(pip3 freeze | grep -q \"pynvim\")" ]; then
  echo "Error: the Python3 package pynvim is not installed."
  dependancyFailure=true
  read -p "Automatically install latest version from pip3? [y/n]: " response
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
  then
    echo "Installing package..."
    pip3 install pynvim
    echo "package successfully installed!"
    dependancyFailure=false
  else
    echo "Skipping..."
  fi
fi

# Check if neovim library is installed
if [ "$(pip3 freeze | grep -q \"neovim\")" ]; then
  echo "Error: the Python3 package neovim is not installed."
  dependancyFailure=true
  read -p "Automatically install latest version from pip3? [y/n]: " response
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
  then
    echo "Installing package..."
    pip3 install neovim
    echo "package successfully installed!"
    dependancyFailure=false
  else
    echo "Skipping..."
  fi
fi


# Sanity check dependancies - Install minor dep in the process...
if [ "$dependancyFailure" = true ]; then
   sudo apt install xclip
   sudo apt install ripgrep
  echo "Error: Please install the dependancies listed above."
  exit 1
fi

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

migrate_snippets () {
  if [ -d "$HOME/.config/nvim/snippets" ]; then
    echo "Removing current snippets directory..."
    rm -rf $HOME/.config/nvim/snippets
  fi

  echo "Migrating repo snippets to current config direcotry..."
  cp -r snippets $HOME/.config/nvim
  echo "Migration Successful! - Restart nvim for changes to take affect."
}

migrate_csnippets () {
  if [ -d "snippets" ]; then
    echo "Removing repo snippets directory..."
    rm -rf snippets
  fi

  echo "Migrating current snippets to repo config directory..."
  cp -r $HOME/.config/nvim/snippets .
}

font_setup () {
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip
  unzip Hack.zip -d NerdFonts
  mkdir -p /usr/share/fonts/NerdFonts
  sudo cp -r NerdFonts/HackNerdFont-Regular.ttf /usr/share/fonts/NerdFonts
  rm -rf Hack.zip NerdFonts LICENSE.md
  fc-cache -fv
  echo "Font setup complete! - Be sure to change your terminal's font to \"Hack Nerd Font Regular\"."
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
  if [ -f "/etc/apt/sources.list.d/neovim-ppa-ubuntu-unstable-jammy.list" ]; then
    echo "Removing existing Neovim repository..."
    sudo apt-get purge neovim &&\
    add-apt-repository --remove ppa:neovim-ppa/unstable
  fi

  # Check if Node.js repository exists and remove it
  if [ -f "/etc/apt/sources.list.d/nodesource.list" ]; then
    echo "Removing existing Node.js repository..."
    sudo apt-get purge nodejs &&\
    rm -r /etc/apt/sources.list.d/nodesource.list
  fi
}

user_input () {
  echo ""
  echo "Please select what you would like to do? "
  echo "1. Migrate repo config ~ THIS WILL REPLACE CURRENT CONFIG"
  echo "2. Migrate repo snippets ~ THIS WILL REPLACE CURRENT SNIPPETS"
  echo "3. Migrate current snippets ~ THIS WILL REPLACE REPO SNIPPETS"
  echo "4. Setup Fonts ~ Needed for nvim-tree to display icons (optional)"
  echo "8. Clean ~ Remove everything added by script"
  echo "9. Exit"

  read -p "Enter your choice: " choice

  case $choice in
    1) 
      migrate_config 
      ;;
    2) 
      migrate_snippets
      ;;
    3)
      migrate_csnippets
      ;;
    4)
      font_setup
      ;;
    8)
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

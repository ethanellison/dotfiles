#!/bin/bash

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install packages from Brewfile
echo "Installing packages from Brewfile..."
brew bundle --file=Brewfile

# Set up Zsh as default shell
echo "Setting up Zsh as default shell..."
chsh -s $(which zsh)

# Set up GPG configuration
# echo "Setting up GPG configuration..."
# mkdir -p ~/.gnupg
# cp gpg/gpg.conf ~/.gnupg/gpg.conf

echo "Installation complete. Please restart your terminal."
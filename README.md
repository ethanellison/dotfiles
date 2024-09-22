# Dotfiles Repository

## Setup Instructions

1. Clone the repository:
   ```sh
   git clone https://github.com/ethanellison/dotfiles.git
   cd dotfiles
   ```

2. Run the installation script:
   ```sh
   chmod +x install.sh
   ./install.sh
   ```

3. Use GNU Stow to symlink dotfiles:
   ```sh
   stow -d stow -t $HOME .
   ```

## Components

- **Homebrew**: Package manager.
- **Stow**: Symlink manager for dotfiles.
- **Neovim**: Text editor.
- **passwordstore**: Password management with GPG.
- **Zsh**: Shell.
- **Starship**: Shell prompt.
- **Tmux**: Terminal multiplexer.

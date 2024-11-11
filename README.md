# Dotfiles Repository

## Prerequisite

### Install Nix

``` sh
sh <(curl -L https://nixos.org/nix/install) --daemon
```

### Run home-manager installation:
   
   ``` sh
   nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
   nix-channel --update
   ```

   Install home-manager
   ``` sh
   nix-shell '<home-manager>' -A install
   ```
### Enable flakes
Add the following line to /etc/nix/nix.conf
experimental-features nix-command flakes

## Setup Instructions

### Clone the repository:
   ```sh
   git clone https://github.com/ethanellison/dotfiles.git
   cd dotfiles
   ```







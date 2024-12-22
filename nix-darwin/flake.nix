{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      imports = 
        [
          ../system/tailscale.nix

        ];
      environment.systemPackages =
        [ 
	  pkgs.neovim
	  pkgs.direnv
          pkgs.neofetch
        ];
      homebrew = {
        enable = true;
        taps = [];
        brews = [];
        casks = [
          "google-chrome"
          "font-jetbrains-mono-nerd-font"
          "iterm2"
          "docker"
        ];
      };
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      programs.zsh.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "x86_64-darwin";
      security.pam.enableSudoTouchIdAuth = true;
      users.users.ethanellison.home = "/Users/ethanellison";
      home-manager.backupFileExtension = "backup";
      nix.configureBuildUsers = true;
      nix.useDaemon = true;
      system.defaults = {
        dock.autohide = true;
        dock.mru-spaces = false;
        finder.AppleShowAllExtensions = true;
        finder.FXPreferredViewStyle = "clmv";
        loginwindow.LoginwindowText = "Hello World";
        screencapture.location = "~/Pictures/screenshots";
        screensaver.askForPasswordDelay = 10;
      };

    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Ethans-MacBook-Air
    darwinConfigurations."Ethans-MacBook-Air" = nix-darwin.lib.darwinSystem {
      modules = [ 
	configuration
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.ethanellison = import ./home.nix;
        }
      ];
    };
  };
}

{
  description = "Home Manager configuration of ethanellison";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      configuration = { pkgs, ... } : {
        imports = [ ./system/tailscale.nix ];
        # homebrew = {
        #   enable = true;
        #   taps = [];
        #   brews = [];
        #   casks = [
        #     "google-chrome"
        #     "font-jetbrains-mono-nerd-font"
        #     "iterm2"
        #     "docker"
        #   ];
        # };
      };
      # system = "x86_64-darwin";
    in {
      homeConfigurations = {
        "ethanellison" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          # Specify your home configuration modules here, for example,
          # the path to your home.nix.

          extraSpecialArgs = {
            inherit inputs;
            vars = {
              username = "ethanellison";
              name = "ethanellison";
              directory = "/home/ethanellison";
              email = "e_21997@hotmail.com";
            };
          };
          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
          modules = [
            configuration
            ./home.nix
            ./shell/sh.nix
          ];
        };
        "pi@pi" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."aarch64-linux";
          # Specify your home configuration modules here, for example,
          # the path to your home.nix.

          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
          extraSpecialArgs = {
            inherit inputs;
            vars = {
              username = "pi";
              name = "pi";
              directory = "/home/pi";
              email = "e_21997@hotmail.com";
            };
          };
          modules = [
            ./home.nix
            ./shell/sh.nix
          ];
        };
      

      };
    };
}

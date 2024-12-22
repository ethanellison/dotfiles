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
      # system = "x86_64-darwin";
    in {
      homeConfigurations = {
        "ethanellison@ubuntu02" = home-manager.lib.homeManagerConfiguration {
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
          modules = [ ./home.nix ];
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
          modules = [ ./home.nix ];
        };
      

      };
    };
}

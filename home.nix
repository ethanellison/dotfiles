{ config, pkgs, ... }:
let
  # My shell aliases
  myAliases = {
    ls = "eza --icons -l -T -L=1";
    cat = "bat";
    htop = "btm";
    fd = "fd -Lu";
    w3m = "w3m -no-cookie -v";
    neofetch = "disfetch";
    fetch = "disfetch";
    gitfetch = "onefetch";
    "," = "comma";
  };
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ethanellison";
  home.homeDirectory = "/home/ethanellison";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    pkgs.hello
    pkgs.neovim
    pkgs.git
    pkgs.fortune
    pkgs.tmux
    pkgs.htop
    pkgs.starship
    pkgs.bat
    pkgs.eza
    pkgs.direnv
    pkgs.nix-direnv
    pkgs.bat
    pkgs.zsh
    pkgs.zsh-autocomplete
    pkgs.lazygit
    pkgs.fabric-ai
    pkgs.oh-my-zsh
    pkgs.zsh-you-should-use
    
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    (pkgs.writeShellScriptBin "my-hello" ''
      echo "Hello, ${config.home.username}!"
    '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    ".tmux.conf".source = tmux/.tmux.conf;
    ".config/starship.toml".source = starship/starship.toml;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ethanellison/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "ethanellison";
    userEmail = "e_21997@hotmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
  
  programs.lazygit.enable = true;
  programs.starship.enable = true;
  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    # enableAutosuggestions = true;
    autosuggestion.enable = true;
    # enableBashCompletion = true;
    enableCompletion = false;
    shellAliases = myAliases;
    initExtra = ''
    eval "$(starship init zsh)"
    bindkey '^P' history-beginning-search-backward
    bindkey '^N' history-beginning-search-forward
    '';
    oh-my-zsh = {
      enable = true;
      plugins = [
      	"git"
	"aliases"
	"aws"
	"docker"
	"docker-compose"
	"dbt"
	"zsh-syntax-highlighting" "zsh-autosuggestions" "you-should-use"
      ];
    };
  };
}

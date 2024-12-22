{ pkgs, ...}:
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
  home.packages = with pkgs; [
    disfetch lolcat cowsay onefetch
    gnugrep gnused
    bat eza bottom fd bc
    direnv nix-direnv
    ripgrep starship 
    oh-my-zsh zsh-autocomplete zsh-you-should-use
    tmux
    devbox
  ];

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
      theme = "robbyrussell";
      plugins = [
      	"git"
	"aliases"
	"aws"
	"docker"
	"docker-compose"
	"dbt"
	"zsh-syntax-highlighting"
        "zsh-autosuggestions"
        "you-should-use"
      ];
    };
  };


  home.file = {
    ".tmux.conf".source = tmux/.tmux.conf;
    ".config/starship.toml".source = starship/starship.toml;
    # ".zshrc".source = zsh/.zshrc;
  };

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
}

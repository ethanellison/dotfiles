# Zsh configuration file

# Load Starship prompt
eval "$(starship init zsh)"

# Set up aliases
alias ll='ls -la'

# Source other Zsh configuration files
for config_file ($HOME/.zshrc.d/*); do
  source $config_file
done
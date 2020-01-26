switch (uname)
    case Darwin
        # Add Homewbrew installed curl to PATH
        set -g fish_user_paths "/usr/local/opt/curl/bin" $fish_user_paths
end

# User paths
set -g fish_user_paths "$HOME/.local/bin" $fish_user_paths

# Set locale
set -x LANG en_US.UTF-8

# Set vim as $EDITOR
set -x EDITOR vim

# Set vscode as $VISUAL
set -x VISUAL 'code -w'

# Remove fish greeting
set fish_greeting

# Abbreviations
abbr -a -g sdocker 'docker --tls -H'
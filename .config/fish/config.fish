switch (uname)
    case Darwin
        # Add Homewbrew installed curl to PATH
        set -g fish_user_paths "/usr/local/opt/curl/bin" $fish_user_paths
end

# Abbreviations
abbr -a -g sdocker 'docker --tls -H'
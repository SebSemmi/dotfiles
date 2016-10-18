export ZSH=~/.zsh
export PATH="/usr/local/sbin:$PATH"

# Load all of the config files in ~/oh-my-zsh that end in .zsh
for config_file ($ZSH/lib/*.zsh) source $config_file

# Load and run compinit
autoload -U compinit
compinit -i

# Visual Studio Code
function code {  
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}

# Alias
alias ls='ls -a'
alias zshconfig="mate ~/.zshrc"
alias launchpadreset="defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock"
alias osxinstaller="sudo /Applications/Install\ OS\ X\ El\ Capitan.app/Contents/Resources/createinstallmedia --volume /Volumes/Install\ OS\ X\ El\ Capitan --applicationpath /Applications/Install\ OS\ X\ El\ Capitan.app --nointeraction"
alias ll="ls -lahL"

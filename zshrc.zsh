# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(sudo zsh-autosuggestions)
#other plugins: zsh-autosuggestions, zsh-autocomplete, git, sudo

##################Script functions from keyboard CLI############
# remove a file with overwrite
function rmk(){
	sudo scrub -p dod $1
	sudo shred -zun 10 -v $1
}

# start nipe
function nps(){
        cd /home/b3l0w/Downloads/nipe
        sudo perl nipe.pl start
        cd /home/b3l0w/
}

# stop nipe
function npo(){
        cd /home/b3l0w/Downloads/nipe
        sudo perl nipe.pl stop
        cd /home/b3l0w/
}

# restart nipe
function npr(){
        cd /home/b3l0w/Downloads/nipe 
        sudo perl nipe.pl restart
        cd /home/b3l0w/
}

# check nipe status
function npt(){
        cd /home/b3l0w/Downloads/nipe
        sudo perl nipe.pl status
        cd /home/b3l0w/
}

# public ip status [clouflare]
function ipu(){
        dig +short txt ch whoami.cloudflare @1.0.0.1
		#for run run in {1..9955}; do sudo perl /home/b3l0w/Downloads/nipe/nipe.pl status | grep ip; done
}

# public ip status [opendns]
function ipp(){
        dig +short myip.opendns.com @resolver1.opendns.com
        # host myip.opendns.com resolver1.opendns.com | grep "myip.opendns.com has" | awk '{print $4}'
}
# public ip status [google]
function ipg(){
        # dig +short txt o-o.myaddr.l.google.com @ns1.google.com
        dig +short txt o-o.myaddr.l.google.com @ns1.google.com | awk -F'"' '{print $2}'
}

# public ip status [icanhazip]
function ipc(){
        wget -qO - icanhazip.com
        # curl icanhazip.com
        # wget -O - -q icanhazip.com
}

# public ip status [ipify]
function ipify(){
        curl -m 120 -w '\n' -sfL 'api{4,6}.ipify.org'
}

# public ip status [aws]
function ipaws(){
        curl checkip.amazonaws.com
}

# private ip status
function ipi(){
        ifconfig | grep "inet | head -1"
}

# check for public ip on the entire server list at once
function allsv(){
        dig +short txt ch whoami.cloudflare @1.0.0.1
        dig +short myip.opendns.com @resolver1.opendns.com
        host myip.opendns.com resolver1.opendns.com | grep "myip.opendns.com has" | awk '{print $4}'
        dig +short txt o-o.myaddr.l.google.com @ns1.google.com
        dig +short txt o-o.myaddr.l.google.com @ns1.google.com | awk -F'"' '{print $2}'
        wget -qO - icanhazip.com
        curl icanhazip.com
        wget -O - -q icanhazip.com
        curl -m 120 -w '\n' -sfL 'api{4,6}.ipify.org'
        curl checkip.amazonaws.com
}

# check public ip status in loop + allsv
function ipl(){
        for run run in {1..9955}; do allsv; done
}

# turn off system
function 0f(){
        sudo shutdown now
}

# restart system
function r3(){
        sudo shutdown -r now
}

# set wallpaper with properties
function wq(){
        feh --bg-fill /home/b3l0w/Pictures/wallhaven-721vx3.jpg
}

# exit the shell
function ee(){
        exit
}

# show the functions in zshrc 
function sal(){
        cat /home/b3l0w/.functions.md
}

# sudo apt update
function sap(){
        sudo apt update
}

# sudo apt upgrade
function sag(){
        sudo apt upgrade
}

# show relevant cli arguments
function lil(){
        cat /home/b3l0w/Documents/auto/utils/cli_arguments.txt
}

# edit zshrc
function edi(){
        nvim ~/.zshrc 
}

# edit functions.md
function fnc(){
        nvim /home/b3l0w/.functions.md
}

# recusively remove all folders
function ran(){
        echo "↓↓input↓↓"
        read input
        #echo "value:, $input"  
        rm -rfv $input
}

# show htb-vpn ip address
funciton hip(){
        sudo ifconfig | grep "inet" | tail -n 3 | head -n 1 
}
################################################################################
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias cat='batcat'
alias n='nano'
alias nv='nvim'
alias pbcy='xclip -selection clipboard'
alias pbps='xclip -selection clipboard -o'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /home/b3l0w/Documents/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="$PATH:/home/b3l0w/go/bin"


# Generated for pdtm. Do not edit.
export PATH=$PATH:/home/b3l0w/.pdtm/go/bin


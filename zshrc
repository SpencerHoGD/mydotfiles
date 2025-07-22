# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/scripts:$PATH"
export PATH=$PATH:/usr/local/go/bin
export RANGER_LOAD_DEFAULT_RC=FALSE
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin/:$PATH"

# also set in /etc/environment
export EDITOR=nvim
export VISUAL=nvim

export BROWSER=chromium

<<<<<<< HEAD
export GO111MODULE=on
=======
# export GO111MODULE=on
# export GOPROXY=https://goproxy.cn
# export UEBERZUGPP_TMPDIR="${TMPDIR}/ueberzugpp"

export GITPROXY=https://ghgo.xyz
>>>>>>> 3ac00d04f91353324dfe49bee129b89096904813

HISTSIZE=100000
SAVEHIST=100000

# archlinuxcn https://www.archlinuxcn.org/archlinux-cn-repo-and-mirror/
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org https://repo.archlinuxcn.org"

# https://specifications.freedesktop.org/basedir-spec/latest/
# below setting is just for me to review
# export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
# export XDG_STATE_HOME="$HOME/.local/share/state"
# export XDG_DATA_DIRS="/usr/local/share/:/usr/share/"
# export XDG_CONFIG_DIRS="/etc/xdg"
# export XDG_CACHE_HOME="$HOME/.cache"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="dst"

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
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

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
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git wd aliases docker themes vi-mode)

source $ZSH/oh-my-zsh.sh
# source <(fzf --zsh)
# FZF_ALT_C_COMMAND= source <(fzf --zsh)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# man $1 | grep -e '$2'
manp() {
    if [[ -n $1 && -n $2 ]]; then
        # Use command substitution to run the commands and capture the output
        local result=$(man $1 | grep -e $2)
        if [[ -n $result ]]; then
            echo "$result"
        else
            echo "No matching content found in the man page for '$1' related to '$2'."
        fi
    else
        echo "Both an argument for the command name (man page) and the search term are required."
    fi
}

# make alias in CLI
mkals() {
    if [[ -n $1 && -n ${@:2} ]]; then
        # Use command substitution to run the commands and capture the output
        local ali="$HOME/dotfiles/zsh/aliases.zsh"
        local tmp="$HOME/dotfiles/zsh/tmp"
        local result=$(echo "alias $1='${@:2}'")
        if [[ -n $result ]]; then
          # echo $result
          echo "$result" | cat - $ali > $tmp && mv $tmp $ali
        else
            echo "echo for '$1' and the expretion '${@:2}' is not ok."
        fi
    else
        echo "please provide alias name '$1' and the expretion '${@:2}'."
    fi
}

# wd list grep
wdp() {
    if [[ -n $1 ]]; then
        wd list | grep $1
    else
        echo "Please provide a search term as an argument."
    fi
}

# --help for commands
h() {
    if [[ -n $1 ]]; then
        $1 --help | less
    else
        echo "Please provide a command."
    fi
}

# # als instead alias | grep something

# pacman installed translate-shell and the command is trans. But the network is not ok.
tr() {
    if [[ -n $1 ]]; then
        chromium "https://translate.google.com/details?sl=auto&tl=en&text=$1&op=translate"
    else
        echo "Please provide some text."
    fi
}

repo () {
    if [[ -n $1 ]]; then
        chromium "https://github.com/$1"
    else
        echo "Please provide user name of github repo."
    fi
}

shs () {
  zsh "$HOME/scripts/$1"
}

# docker completion
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes


bindkey -v
bindkey -M viins 'jk' vi-cmd-mode


# fnm
FNM_PATH="/home/hxm/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/hxm/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
export PATH=$PATH:/usr/local/bin

# f instead of y for yazi because f is more reachable.
function f() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

eval "$(zoxide init zsh)"


. "/root/.acme.sh/acme.sh.env"

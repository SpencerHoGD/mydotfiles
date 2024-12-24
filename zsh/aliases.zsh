alias vv='source $HOME/venv/bin/activate'
alias dv='deactivate'
alias vh='nvim ~/history.txt'
alias wdl='wd list'
alias neo='neofetch'
alias lss='cd ~/scripts/ && l'
alias ra='ranger'
alias e='exit'
alias c='clear'
alias v='nvim'
alias nv='nvim'

alias ba='cd ~/.oh-my-zsh/custom && nvim ./aliases.zsh'
alias bb='source ~/.zshrc'
alias be='exec zsh'

alias rc='nvim ~/.zshrc'
alias rcn='nvim ~/.init.vim'
alias sbox='sing-box'
alias lg='lazygit'
alias fzf='fzf --height 50% --layout reverse --border'
# commands options gpm -- in .zshrc
alias mci='make clean install'

## sing-box service
alias sba='systemctl start sing-box@tun.service'
alias sbo='systemctl stop sing-box@tun.service'
alias sbr='systemctl restart sing-box@tun.service'
alias sbk='systemctl kill sing-box@tun.service'
alias sbs='systemctl status sing-box@tun.service'
alias sbe='systemctl enable sing-box@tun.service'
alias sbd='systemctl disable sing-box@tun.service'

alias sbj='journalctl -u sing-box@tun.service --output cat -e '
alias sbn='journalctl -u sing-box@tun.service --output cat -f '

## bluetooth.service
alias bta='systemctl start bluetooth.service'
alias bto='systemctl stop bluetooth.service'
alias bts='systemctl status bluetooth.service'
alias bte='systemctl enable bluetooth.service'
alias btd='systemctl disable bluetooth.service'

## check ip
alias iptest='curl ip.me && curl ipinfo.io'


alias ins='apt install'
alias a='~'
alias yt='yt-dlp'
alias yta='yt-dlp -f "bestaudio/best"'
# alias yts='yt-dlp --write-sub --write-auto-sub --sub-lang "en.*"'
alias yts='yt-dlp --write-auto-sub'
alias yte='yt-dlp --embed-subs'


alias rbbb='systemctl reboot'
# alias sttt='systemctl poweroff'
alias sttt='shutdown -h now'

alias X='chmod +x'

alias syss='systemctl status'
alias syse='systemctl enable'
alias sysd='systemctl disable'
alias sysa='systemctl start'
alias sysr='systemctl restart'
alias syso='systemctl stop'


# docker

alias dk='docker'
alias dkh='docker --help'
alias dkps='docker ps' # List containers
alias dkpa='docker ps -a'
alias dkpsa='docker ps -a'
alias dksta='docker start'
alias dksss='docker status'
alias dksto='docker stop'

alias dkrn='docker rename'

alias dkimg='docker images'
alias dkp='docker pull'
alias dksh='docker search'

alias dkc='docker container'
alias dkch='docker container --help'
alias dkca='docker container start'
alias dkcs='docker container stats'
alias dkco='docker container stop'

alias dkrm='docker rm' # remove conteiner
alias dkrmi='docker rmi' # remove images


# alias grep
alias ag='alias | grep "$1"'

alias py='python3'
alias ppi='pip install'
alias ppu='pip install --upgrade pip'

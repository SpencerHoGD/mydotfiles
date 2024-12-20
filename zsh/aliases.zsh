alias tun='nvim ~/sing-box-data/tun.json'
alias ch='chromium'
alias vv='source $HOME/venv/bin/activate'
alias dv='deactivate'
alias vh='nvim ~/history.txt'
alias eb='ebook-viewer'
alias wdl='wd list'
alias neo='neofetch'
alias lss='cd ~/scripts/ && l'
alias bg='change_wallpaper.sh'
# alias chromium='chromium --high-dpi-support=1 --force-device-scale-factor=2'
alias la='ssh la'
# start joshuto through ~/scripts/jo short for joshuto from Uberzug script 
# https://github.com/kamiyaa/joshuto/blob/main/docs/image_previews/ueberzug.md
alias jo='joshuto'
alias ra='ranger'
alias e='exit'
alias c='clear'
alias v='nvim'
alias nv='nvim'

alias ba='cd ~/dotfiles/ && nvim ./zsh/aliases.zsh'
alias bb='source ~/.zshrc'
alias be='exec zsh'

alias rc='nvim ~/.zshrc'
alias rcn='nvim ~/.init.vim'
alias rx='nvim ~/.xinitrc'
alias sbox='sing-box'
alias lg='lazygit'
alias fzf='fzf --height 50% --layout reverse --border'
# commands options gpm -- in .zshrc
alias mci='sudo make clean install'
alias inter='interpreter'

## sing-box service
alias sba='sudo systemctl start sing-box@tun.service'
alias sbo='sudo systemctl stop sing-box@tun.service'
alias sbr='sudo systemctl restart sing-box@tun.service'
alias sbk='sudo systemctl kill sing-box@tun.service'
alias sbs='sudo systemctl status sing-box@tun.service'
alias sbe='sudo systemctl enable sing-box@tun.service'
alias sbd='sudo systemctl disable sing-box@tun.service'

alias sbj='sudo journalctl -u sing-box@tun.service --output cat -e '
alias sbn='sudo journalctl -u sing-box@tun.service --output cat -f '

## bluetooth.service
alias bta='sudo systemctl start bluetooth.service'
alias bto='sudo systemctl stop bluetooth.service'
alias bts='sudo systemctl status bluetooth.service'
alias bte='sudo systemctl enable bluetooth.service'
alias btd='sudo systemctl disable bluetooth.service'

## check ip
alias iptest='curl ip.me && curl ipinfo.io'


alias pau='sudo pacman -Syu'
alias ins='sudo pacman -Sy'
alias pai='sudo pacman -Sy'
alias pas='sudo pacman -Ss'
alias par='sudo pacman -R'
alias pagq='pacman -Sgq'    # pacman -Sgq nerd-fonts show all in this group?
# sudo pacman -S $(pacman -Sgq nerd-fonts)
alias paq='pacman -Q'
alias paqu='pacman -Qu'
alias a='~'
alias yt='yt-dlp'
alias yta='yt-dlp -f "bestaudio/best"'
# alias yts='yt-dlp --write-sub --write-auto-sub --sub-lang "en.*"'
alias yts='yt-dlp --write-auto-sub'
alias yte='yt-dlp --embed-subs'


alias rbbb='systemctl reboot'
alias sttt='systemctl poweroff'

alias X='chmod +x'

alias syss='sudo systemctl status'
alias syse='sudo systemctl enable'
alias sysd='sudo systemctl disable'
alias sysa='sudo systemctl start'
alias sysr='sudo systemctl restart'
alias syso='sudo systemctl stop'


# docker

alias dk='sudo docker'
alias dkh='sudo docker --help'
alias dkps='sudo docker ps' # List containers
alias dkpa='sudo docker ps -a'
alias dkpsa='sudo docker ps -a'
alias dksta='sudo docker start'
alias dksss='sudo docker status'
alias dksto='sudo docker stop'

alias dkrn='sudo docker rename'

alias dkimg='sudo docker images'
alias dkp='sudo docker pull'
alias dksh='sudo docker search'

alias dkc='sudo docker container'
alias dkch='sudo docker container --help'
alias dkca='sudo docker container start'
alias dkcs='sudo docker container stats'
alias dkco='sudo docker container stop'

alias dkrm='sudo docker rm' # remove conteiner
alias dkrmi='sudo docker rmi' # remove images


# alias grep
alias ag='alias | grep "$1"'

alias py='python3'
alias ppi='pip install'
alias ppu='pip install --upgrade pip'

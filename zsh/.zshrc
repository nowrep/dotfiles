# ZSH CONFIGURATION
#
# - use git config --add oh-my-zsh.hide-status 1
#   for very big repositories to disable status
#   checking and greatly improves speed

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="nowrep"

plugins=(git archlinux colored-man-pages safe-paste)

source $ZSH/oh-my-zsh.sh

# Track cwd
osc7_cwd() {
    printf '\e]7;file://%s%s\e\\' "$(omz_urlencode -P $HOST)" "$(omz_urlencode -P "$PWD")"
}
autoload -Uz add-zsh-hook
add-zsh-hook -Uz chpwd osc7_cwd

# tab width
tabs -4

# foot workaround
bindkey "\e[27;2;13~" accept-line # shift+return
bindkey "\e[27;5;13~" accept-line # ctrl+return
bindkey "\e[27;3;9~" beep # alt+tab

# No shared history
unsetopt share_history

# Disable highlighting paste
zle_highlight=(none)

# Vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# Set longer history
export HISTSIZE=100000
export HISTFILESIZE=100000
export LISTMAX=9999
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear:ll"

# Change default shell text editor
export EDITOR=/usr/bin/nvim

# Change default shell pager
export PAGER="less --tabs=4 -i"
export LESSHISTFILE=/dev/null
alias less=$PAGER

# fzf
export FZF_DEFAULT_COMMAND="ag -l"
export FZF_DEFAULT_OPTS="--preview 'cat {}'"

# make
export MAKEFLAGS="-j24"

# gpg
export GPG_TTY=$(tty)

# Aliases
alias ll="ls -lhG"
alias grep="grep --color=auto"
alias cds="cd ~/Documents/skola"
alias cdp="cd ~/Documents/prace"
alias dmesg="journalctl -b"
alias diff="colordiff"
alias valgrind-full="valgrind --leak-check=full --show-reachable=yes --track-origins=yes"
alias cmake="cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_COLOR_DIAGNOSTICS=ON -GNinja"
alias vi='nvim'
alias vim='nvim'
alias vimdiff='nvim -d'
alias pingg='ping -c 3 8.8.8.8'
alias objdump='objdump -M intel'
alias hukotvpn="(cd ~/Documents/vpn && sudo openvpn client.conf)"
alias rocm-smi='/opt/rocm/bin/rocm-smi'
alias cal='cal -m'

# Sudo aliases
alias sudo="nocorrect sudo "

# Pac aliases
alias aa='yay'
alias asearch='pacman -Ss'
alias aasearch='yay -as'
alias aup='yay -Syu'
alias ain='sudo pacman -S'
alias ains='sudo pacman -U'
alias are='sudo pacman -Rsn'

function backuphome {
    cd
    tar -cvJ \
        --exclude '*.o' \
        --exclude '.git/*' \
        --exclude 'build/*' \
        --exclude 'target/*' \
        --exclude 'flatpak' \
        --exclude 'Steam' \
        --exclude 'pkgbuilds' \
        --exclude 'rpcs3' \
        -f /media/Data/Backup/backup_`date +%Y%m%d`.tar.xz \
        Documents \
        Pictures \
        Programming \
        .config \
        .thunderbird \
        .mozilla \
        .oh-my-zsh \
        .ssh \
        .electrum \
        .filezilla \
        .local \
        && echo "Backup successfull!"

    cd -
}

function avahi-ip {
    avahi-resolve -n "$1".local | cut -f2
}

function shares-start {
    cd ~/Shares/webdav/
    nohup ./dave > /dev/null 2>&1 &
    cd - > /dev/null
}

function shares-stop {
    pkill dave
}

function dlna-start {
    sudo rm /var/cache/private/minidlna/files.db
    sudo systemctl start minidlna
}

function dlna-stop {
    sudo systemctl stop minidlna
}

function vita-env {
    export VITASDK=/media/Data/Vita/SDK/vitasdk
    export PATH=$VITASDK/bin:$PATH
}

function 3ds-env {
    export DEVKITPRO=/media/Data/3DS/SDK
    export DEVKITARM=$DEVKITPRO/devkitARM
    export PATH=$PATH:$DEVKITARM/bin:/media/Data/3DS/tools
}

function android-env {
    export ANDROID_SDK_ROOT=/media/Data/Android/Sdk
    export ANDROID_NDK_ROOT=/media/Data/Android/android-ndk-r15c
    export PATH=/media/Data/Android/Qt-5.9.2/5.9.2/android_armv7/bin:$PATH
}

function record-desktop {
    wf-recorder -a"alsa_output.pci-0000_0c_00.4.analog-stereo.monitor" -c hevc_vaapi
}

function tv-enable {
    swaymsg 'output HDMI-A-1 enable'
    swaymsg 'seat seat0 pointer_constraint disable'
    xrandr --output HDMI-A-1 --primary
    pkill -SIGUSR1 wljoywake
}

function tv-disable {
    swaymsg 'output HDMI-A-1 disable'
    swaymsg 'seat seat0 pointer_constraint enable'
    pkill -SIGUSR2 wljoywake
}

function extract_icons {
    name="${1%.*}"
    wrestool -x -t 14 "$1" > ${name}.ico
    index=$(icotool -l ${name}.ico | wc -l)
    icotool -i ${index} -x ${name}.ico
    rm ${name}.ico
    mv ${name}_${index}_*.png ${name}_icon.png
}

# Private
source ~/.zshrc_private

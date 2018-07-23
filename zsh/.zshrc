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
export PAGER="less -i"
export LESSHISTFILE=/dev/null
alias less=$PAGER

# fzf
export FZF_DEFAULT_COMMAND="ag -l"
export FZF_DEFAULT_OPTS="--preview 'cat {}'"

# make
export MAKEFLAGS="-j12"

# gpg
export GPG_TTY=$(tty)

# Aliases
alias ls="exa"
alias ll="ls -l"
alias monitor_off="xset dpms force off"
alias grep="grep --color=auto --line-number"
alias cdq="cd ~/Programming/Qt-C++/QupZilla"
alias cdf="cd ~/Programming/Qt-C++/falkon"
alias cdk="cd /media/Data/KDE"
alias cds="cd ~/Documents/skola"
alias cdp="cd ~/Documents/prace"
alias dmesg="journalctl -b"
alias diff="colordiff"
alias valgrind-full="valgrind --leak-check=full --show-reachable=yes --track-origins=yes"
alias kf5-env="source /media/Data/KDE/env.sh"
alias callgrind="valgrind --tool=callgrind"
alias cmake="cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -GNinja"
alias kf5-cmake="cmake .. -DCMAKE_CXX_FLAGS:STRING=-pipe -DCMAKE_INSTALL_PREFIX=/media/Data/KDE"
alias vi='nvim'
alias vim='nvim'
alias vimdiff='nvim -d'
alias pingg='ping -c 3 8.8.8.8'
alias objdump='objdump -M intel'
alias hukotvpn="(cd ~/Documents/vpn && sudo openvpn client.conf)"

# Sudo aliases
alias sudo="nocorrect sudo "
alias powertop="sudo powertop"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias adb-stop="sudo adb kill-server"

# Pac aliases
alias aa='yay'
alias asearch='pacman -Ss'
alias aasearch='yay -as'
alias aup='yay -Syu'
alias ain='sudo pacman -S'
alias aain='yay -y'
alias ains='sudo pacman -U'
alias are='sudo pacman -Rsn'

function cdbuild {
    local outdir=$(echo $PWD | sed "s/source/source\/build/g")
    cd $outdir
}

function backuphome {
    cd
    tar -cvJ \
        --exclude '*.o' \
        --exclude '.git/*' \
        --exclude 'build/*' \
        --exclude 'flatpak' \
        --exclude 'Steam' \
        -f /media/Data/Backup/backup_`date +%Y%m%d`.tar.xz \
        Documents \
        Pictures \
        Programming \
        .config \
        .thunderbird \
        .mozilla \
        .oh-my-zsh \
        .ssh \
        .kde \
        .electrum \
        .filezilla \
        .local \
        .transifexrc \
        .zprofile \
        .zsh_history \
        .zshrc && echo "Backup successfull!"

    cd -
}

function avahi-ip {
    avahi-resolve -n "$1".local | cut -f2
}

function encode_c7 {
    ffmpeg -i "$1" -threads 4 -vcodec libx264 -s 640x360 -strict experimental out.mp4
}

function encode_motog {
    ffmpeg -i "$1" -threads 4 -vcodec libx264 -s 1280x720 -strict experimental out.mp4
}

function encode_8bit {
    local tmpfile=/tmp/8bit.mkv
    x264 --preset veryfast --tune animation --crf 18 -o $tmpfile "$1"
    mkvmerge -o "$1.8bit.mkv" -D "$1" -A -S -T -M -B $tmpfile
    rm $tmpfile
}

function tv-play {
    # Program: 16644-16648
    case "$1" in
        ct1)
            PROGRAM=257
            FREQUENCY=730
            ;;
        ct2)
            PROGRAM=258
            FREQUENCY=730
            ;;
        ct24)
            PROGRAM=259
            FREQUENCY=730
            ;;
        ctsport)
            PROGRAM=260
            FREQUENCY=730
            ;;
        nova)
            PROGRAM=513
            FREQUENCY=634
            ;;
        novacinema)
            PROGRAM=514
            FREQUENCY=634
            ;;
        prima)
            PROGRAM=773
            FREQUENCY=634
            ;;
        *)
            PROGRAM=260
            FREQUENCY=730
            ;;
    esac
    cvlc dvb-t://frequency=${FREQUENCY}000000 --dvb-bandwidth=8 --program=$PROGRAM
}

function xbox-ps3 {
    sudo xboxdrv \
     --evdev /dev/input/event21 \
     --evdev-absmap ABS_X=x1,ABS_Y=y1,ABS_Z=x2,ABS_RZ=y2,ABS_#48=lt,ABS_#49=rt \
     --evdev-keymap BTN_THUMB=tl,BTN_THUMB2=tr,BTN_BASE5=lb,BTN_BASE6=rb,KEY_#302=a,KEY_#301=b,BTN_DEAD=x,KEY_#300=y,BTN_TRIGGER=back,KEY_#720=guide,BTN_TOP=start,BTN_TOP2=du,BTN_PINKIE=dr,BTN_BASE=dd,BTN_BASE2=dl \
     --axismap -y1=y1,-y2=y2 \
     --silent
}

function shares-start {
    sudo systemctl start vsftpd
    sudo mount --bind /media/Data/Torrents ~/Shares/ftp/Videos/Torrents
    sudo mount --bind /media/Data/Videa ~/Shares/ftp/Videos/Videa
    sudo mount --bind ~/Music ~/Shares/ftp/Music
}

function shares-stop {
    sudo systemctl stop vsftpd
    sudo umount ~/Shares/ftp/Videos/Torrents
    sudo umount ~/Shares/ftp/Videos/Videa
    sudo umount ~/Shares/ftp/Music
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

# Private
source ~/.zshrc_private
